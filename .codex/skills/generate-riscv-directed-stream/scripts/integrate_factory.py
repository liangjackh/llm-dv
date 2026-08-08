#!/usr/bin/env python3
"""Idempotently check or add one generated stream to pygen's factory mapping."""

import argparse
import ast
import re
from pathlib import Path

NAME = re.compile(r"^[A-Za-z_][A-Za-z0-9_]*$")
MODULE = re.compile(r"^[A-Za-z_][A-Za-z0-9_.]*$")


def locate_factory_dict(tree):
    for node in tree.body:
        if isinstance(node, ast.FunctionDef) and node.name == "factory":
            for child in node.body:
                if isinstance(child, ast.Assign) and any(
                        isinstance(target, ast.Name) and target.id == "objs"
                        for target in child.targets):
                    if isinstance(child.value, ast.Dict):
                        return node, child.value
    raise ValueError("cannot locate factory() objs dictionary")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--utils", type=Path, required=True)
    parser.add_argument("--module", required=True)
    parser.add_argument("--class-name", required=True)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--check", action="store_true")
    mode.add_argument("--apply", action="store_true")
    args = parser.parse_args()
    if not NAME.fullmatch(args.class_name) or not MODULE.fullmatch(args.module):
        raise SystemExit("FAIL: invalid module or class name")

    text = args.utils.read_text(encoding="utf-8")
    tree = ast.parse(text, filename=str(args.utils))
    factory_node, dictionary = locate_factory_dict(tree)
    import_line = f"from {args.module} import {args.class_name}"
    has_import = any(
        isinstance(node, ast.ImportFrom) and node.module == args.module and
        any(alias.name == args.class_name for alias in node.names)
        for node in tree.body)
    has_mapping = any(
        isinstance(key, ast.Constant) and key.value == args.class_name
        for key in dictionary.keys)

    if args.check:
        if has_import and has_mapping:
            print(f"PASS: {args.class_name} is imported and registered")
            return
        missing = []
        if not has_import:
            missing.append("import")
        if not has_mapping:
            missing.append("mapping")
        raise SystemExit("NOT INTEGRATED: missing " + " and ".join(missing))

    lines = text.splitlines(keepends=True)
    if not has_mapping:
        closing_index = dictionary.end_lineno - 1
        previous_index = closing_index - 1
        while previous_index >= 0 and not lines[previous_index].strip():
            previous_index -= 1
        if previous_index >= 0 and not lines[previous_index].rstrip().endswith(","):
            lines[previous_index] = lines[previous_index].rstrip("\n").rstrip() + ",\n"
        indent = " " * (factory_node.col_offset + 8)
        lines.insert(closing_index, f'{indent}"{args.class_name}": {args.class_name},\n')
    if not has_import:
        import_index = factory_node.lineno - 1
        lines.insert(import_index, import_line + "\n\n")
    args.utils.write_text("".join(lines), encoding="utf-8")
    print(f"PASS: integrated {args.class_name} into {args.utils}")


if __name__ == "__main__":
    main()
