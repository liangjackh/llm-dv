#!/usr/bin/env python3
"""Import and randomize a generated stream inside the repository's pygen environment."""

import argparse
import importlib
import json
import random
import sys
from pathlib import Path


def parse_cli():
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo-root", type=Path, required=True)
    parser.add_argument("--module", required=True,
                        help="Dotted module below pygen/, for example pygen_src.llm_patterns.demo")
    parser.add_argument("--class-name", required=True)
    parser.add_argument("--target", default="rv32imc")
    parser.add_argument("--seed", type=int, default=123)
    parser.add_argument("--json-output", type=Path)
    parser.add_argument("--asm-output", type=Path)
    return parser.parse_args()


def main():
    args = parse_cli()
    repo_root = args.repo_root.resolve()
    pygen_root = repo_root / "pygen"
    if not (pygen_root / "pygen_src").is_dir():
        raise SystemExit(f"FAIL: {repo_root} is not a riscv-dv repository with pygen/pygen_src")
    sys.path.insert(0, str(pygen_root))

    # riscv_instr_gen_config constructs global cfg at import time and parses sys.argv.
    sys.argv = [sys.argv[0], "--target", args.target, "--seed", str(args.seed)]
    random.seed(args.seed)

    try:
        module = importlib.import_module(args.module)
        stream_class = getattr(module, args.class_name)
        from pygen_src.isa.riscv_instr import riscv_instr
        from pygen_src.riscv_instr_gen_config import cfg, rcs
        for isa in rcs.supported_isa:
            importlib.import_module("pygen_src.isa." + isa.name.lower() + "_instr")
        cfg.randomize()
        riscv_instr.create_instr_list(cfg)
        stream = stream_class()
        stream.name = args.class_name
        stream.randomize()
        assembly = [instr.convert2asm().strip() for instr in stream.instr_list]
    except (Exception, SystemExit) as exc:
        print(f"FAIL: {type(exc).__name__}: {exc}")
        raise SystemExit(1) from exc

    if not assembly:
        raise SystemExit("FAIL: randomize() produced an empty instr_list")
    result = {
        "status": "PASS",
        "module": args.module,
        "class_name": args.class_name,
        "target": args.target,
        "seed": args.seed,
        "instruction_count": len(assembly),
        "assembly": assembly,
    }
    if args.json_output:
        args.json_output.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    if args.asm_output:
        args.asm_output.write_text("\n".join(assembly) + "\n", encoding="utf-8")
    print(f"PASS: randomized {args.class_name}; emitted {len(assembly)} instructions")
    for line in assembly[:20]:
        print(f"  {line}")


if __name__ == "__main__":
    main()
