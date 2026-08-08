#!/usr/bin/env python3
"""Generate one riscv-dv pygen testlist entry from a pattern requirement."""

import argparse
import re
from pathlib import Path


def load_yaml(path):
    try:
        import yaml
    except ImportError as exc:
        raise SystemExit("PyYAML is required") from exc
    data = yaml.safe_load(path.read_text(encoding="utf-8"))
    if not isinstance(data, dict):
        raise SystemExit("FAIL: requirement root must be a mapping")
    return data, yaml


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("requirement", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    req, yaml = load_yaml(args.requirement)
    name = req.get("name")
    runtime = req.get("runtime") or {}
    if not isinstance(name, str) or not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", name):
        raise SystemExit("FAIL: requirement.name must be a Python class name")
    ratio = runtime.get("insertion_ratio")
    instr_count = runtime.get("instruction_count")
    iterations = runtime.get("iterations", 1)
    if not isinstance(ratio, int) or not 1 <= ratio <= 1000:
        raise SystemExit("FAIL: runtime.insertion_ratio must be 1..1000")
    if not isinstance(instr_count, int) or instr_count <= 0:
        raise SystemExit("FAIL: runtime.instruction_count must be positive")
    if not isinstance(iterations, int) or iterations <= 0:
        raise SystemExit("FAIL: runtime.iterations must be positive")
    entry = [{
        "test": name.removesuffix("_stream") + "_test",
        "description": req.get("description", f"LLM-generated pattern {name}"),
        "gen_test": "riscv_instr_base_test",
        "iterations": iterations,
        "gen_opts": f"+instr_cnt={instr_count} +num_of_sub_program=0 "
                    f"+directed_instr_0={name},{ratio}",
    }]
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(yaml.safe_dump(entry, sort_keys=False), encoding="utf-8")
    print(f"PASS: wrote testlist for {name} to {args.output}")


if __name__ == "__main__":
    main()
