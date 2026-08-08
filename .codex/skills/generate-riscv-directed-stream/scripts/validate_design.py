#!/usr/bin/env python3
"""Validate a generated class/inheritance design without importing pygen."""

import argparse
import re
from pathlib import Path

NAME = re.compile(r"^[A-Za-z_][A-Za-z0-9_]*$")
DEFAULT_ROOTS = {"riscv_instr_stream", "riscv_rand_instr_stream",
                 "riscv_directed_instr_stream", "riscv_mem_access_stream"}


def load_yaml(path):
    try:
        import yaml
    except ImportError as exc:
        raise SystemExit("PyYAML is required to validate a design") from exc
    data = yaml.safe_load(path.read_text(encoding="utf-8"))
    if not isinstance(data, dict):
        raise SystemExit("FAIL: design root must be a mapping")
    return data


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("design", type=Path)
    args = parser.parse_args()
    data = load_yaml(args.design)
    errors = []
    entry = data.get("entry_class")
    entries = data.get("classes")
    roots = set(data.get("approved_roots") or DEFAULT_ROOTS)
    if not NAME.fullmatch(entry or ""):
        errors.append("entry_class must be a valid Python class name")
    if not isinstance(entries, list) or not entries:
        errors.append("classes must be a non-empty list")
        entries = []

    by_name = {}
    for index, item in enumerate(entries):
        if not isinstance(item, dict):
            errors.append(f"classes[{index}] must be a mapping")
            continue
        name, parent, module = item.get("name"), item.get("extends"), item.get("module")
        if not NAME.fullmatch(name or ""):
            errors.append(f"classes[{index}].name is invalid")
            continue
        if name in by_name:
            errors.append(f"duplicate class {name}")
        by_name[name] = item
        if not NAME.fullmatch(parent or ""):
            errors.append(f"{name}.extends is invalid")
        if not isinstance(module, str) or not module.startswith("pygen_src."):
            errors.append(f"{name}.module must start with pygen_src.")
        if not isinstance(item.get("responsibilities"), list) or not item["responsibilities"]:
            errors.append(f"{name} must declare responsibilities")

    if entry not in by_name:
        errors.append(f"entry class {entry!r} is not declared")
    registered = [name for name, item in by_name.items() if item.get("register") is True]
    if registered != ([entry] if entry in by_name else []):
        errors.append(f"exactly entry_class must be registered; found {registered}")
    for name, item in by_name.items():
        parent = item.get("extends")
        if parent not in by_name and parent not in roots:
            errors.append(f"{name} extends unresolved class {parent!r}")

    state = {}
    def visit(name, trail):
        if name in roots:
            return name
        if name not in by_name:
            return None
        if state.get(name) == 1:
            errors.append("inheritance cycle: " + " -> ".join(trail + [name]))
            return None
        if state.get(name) == 2:
            return None
        state[name] = 1
        root = visit(by_name[name].get("extends"), trail + [name])
        state[name] = 2
        return root

    reached_root = visit(entry, []) if entry in by_name else None
    for name in by_name:
        visit(name, [])
    if entry in by_name and reached_root is None and not any("inheritance cycle" in e for e in errors):
        errors.append("entry class does not reach an approved pygen root")
    if errors:
        for error in dict.fromkeys(errors):
            print(f"FAIL: {error}")
        raise SystemExit(1)
    print(f"PASS: {entry} reaches {reached_root} through an acyclic {len(by_name)}-class design")


if __name__ == "__main__":
    main()
