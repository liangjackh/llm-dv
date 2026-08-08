#!/usr/bin/env python3
"""Validate a generated directed-stream module without importing pygen."""

import argparse
import ast
import json
from pathlib import Path


def fail(messages):
    for message in messages:
        print(f"FAIL: {message}")
    raise SystemExit(1)


def load_config(path):
    if path is None:
        return None
    text = path.read_text(encoding="utf-8")
    if path.suffix.lower() == ".json":
        return json.loads(text)
    try:
        import yaml
    except ImportError as exc:
        raise SystemExit("PyYAML is required to validate YAML configuration") from exc
    return yaml.safe_load(text)


def class_bases(node):
    names = []
    for base in node.bases:
        if isinstance(base, ast.Name):
            names.append(base.id)
        elif isinstance(base, ast.Attribute):
            names.append(base.attr)
    return names


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("module", type=Path)
    parser.add_argument("--class-name", required=True)
    parser.add_argument("--base-class", required=True)
    parser.add_argument("--config", type=Path)
    args = parser.parse_args()

    errors = []
    try:
        tree = ast.parse(args.module.read_text(encoding="utf-8"), filename=str(args.module))
    except (OSError, SyntaxError) as exc:
        fail([str(exc)])

    classes = {node.name: node for node in tree.body if isinstance(node, ast.ClassDef)}
    cls = classes.get(args.class_name)
    if cls is None:
        errors.append(f"class {args.class_name!r} was not found")
    else:
        if args.base_class not in class_bases(cls):
            errors.append(f"{args.class_name} does not directly extend {args.base_class}")
        methods = {node.name: node for node in cls.body if isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef))}
        for required in ("__init__", "post_randomize"):
            if required not in methods:
                errors.append(f"missing required method {required}()")
        if not any(isinstance(node, ast.Attribute) and node.attr == "instr_list" for node in ast.walk(cls)):
            errors.append("class never references instr_list")

    imported_names = set()
    imported_modules = set()
    for node in tree.body:
        if isinstance(node, ast.Import):
            imported_names.update(alias.name for alias in node.names)
            imported_modules.update(alias.name for alias in node.names)
        elif isinstance(node, ast.ImportFrom):
            imported_names.update(alias.name for alias in node.names)
            if node.module:
                imported_modules.add(node.module)
    if "vsc" not in imported_names:
        errors.append("module does not import vsc")
    if not any(name.startswith("pygen_src") for name in imported_modules):
        errors.append("module does not import a pygen_src API")

    config = load_config(args.config)
    if args.config is not None and not isinstance(config, dict):
        errors.append("configuration root must be a mapping")

    if errors:
        fail(errors)
    print(f"PASS: {args.class_name} satisfies the directed-stream source contract")


if __name__ == "__main__":
    main()
