#!/usr/bin/env python3
"""Check architecture-independent BPU pressure evidence in generated assembly."""
import argparse
import re
from pathlib import Path

CONTROL = re.compile(r"^\s*(?:(?P<label>[A-Za-z_][\w]*):)?\s*(?P<op>beq|bne|blt|bge|bltu|bgeu|jal|jalr)\s+(?P<args>[^#]+)", re.I)
TARGET = re.compile(r"([A-Za-z_][\w]*)\s*$")

def main():
    p = argparse.ArgumentParser()
    p.add_argument("assembly", type=Path)
    p.add_argument("--minimum-branch-sites", type=int, required=True)
    p.add_argument("--minimum-unique-targets", type=int, required=True)
    p.add_argument("--minimum-call-return-pairs", type=int, default=1)
    args = p.parse_args()
    sites = 0
    conditional = 0
    taken = not_taken = 0
    targets = set()
    labels = set()
    calls = returns = blocks = 0
    active = False
    text = args.assembly.read_text(encoding="utf-8", errors="replace")
    for line in text.splitlines():
        lowered = line.lower()
        if "start riscv_llm_bpu_capacity_pressure_stream" in lowered:
            active = True
            blocks += 1
        if not active:
            continue
        label_match = re.match(r"^\s*([A-Za-z_][\w]*):", line)
        if label_match:
            labels.add(label_match.group(1))
        match = CONTROL.match(line)
        if match:
            op, operands = match.group("op").lower(), match.group("args").strip()
            sites += 1
            if op in {"beq", "bne", "blt", "bge", "bltu", "bgeu"}:
                conditional += 1
            if op == "beq" and re.match(r"(?:zero|x0)\s*,\s*(?:zero|x0)\s*,", operands, re.I):
                taken += 1
            if op == "bne" and re.match(r"(?:zero|x0)\s*,\s*(?:zero|x0)\s*,", operands, re.I):
                not_taken += 1
            if op in {"beq", "bne", "blt", "bge", "bltu", "bgeu", "jal"}:
                target = TARGET.search(operands)
                if target:
                    targets.add(target.group(1))
            if op == "jal" and re.match(r"(?:ra|x1)\s*,", operands, re.I):
                calls += 1
            if op == "jalr" and re.match(r"(?:zero|x0)\s*,\s*(?:ra|x1)\s*,\s*0", operands, re.I):
                returns += 1
        if "end riscv_llm_bpu_capacity_pressure_stream" in lowered:
            active = False
    errors = []
    if blocks == 0:
        errors.append("no BPU directed-stream blocks found")
    missing_targets = sorted(targets - labels)
    if missing_targets:
        errors.append(f"{len(missing_targets)} control-flow targets have no matching label")
    if conditional < args.minimum_branch_sites:
        errors.append(f"conditional branch sites {conditional} < {args.minimum_branch_sites}")
    if taken == 0 or not_taken == 0:
        errors.append(f"missing outcome mix: taken={taken} not_taken={not_taken}")
    if len(targets) < args.minimum_unique_targets:
        errors.append(f"unique targets {len(targets)} < {args.minimum_unique_targets}")
    pairs = min(calls, returns)
    if pairs < args.minimum_call_return_pairs:
        errors.append(f"call/return pairs {pairs} < {args.minimum_call_return_pairs}")
    if active:
        errors.append("unterminated BPU directed-stream block")
    if errors:
        for error in errors:
            print(f"FAIL: {error}")
        raise SystemExit(1)
    print(f"PASS: blocks={blocks} conditional_branches={conditional} taken={taken} not_taken={not_taken} control_flow_sites={sites} unique_targets={len(targets)} call_return_pairs={pairs}")

if __name__ == "__main__":
    main()
