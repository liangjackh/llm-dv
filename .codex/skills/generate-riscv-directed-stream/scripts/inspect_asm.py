#!/usr/bin/env python3
"""Check semantic patterns in generated RISC-V assembly."""

import argparse
import re
from pathlib import Path

REGISTER = r"(?:x\d+|zero|ra|sp|gp|tp|t[0-6]|s(?:[0-9]|1[01])|a[0-7])"
MEMORY = re.compile(rf"^\s*(?P<op>[a-z][a-z0-9.]*)\s+[^,]+,\s*"
                    rf"(?P<addr>-?(?:0x[0-9a-f]+|\d+)\({REGISTER}\))", re.I)
ALU = re.compile(rf"^\s*(?P<op>add|sub|xor|or|and)\s+"
                 rf"(?P<rd>{REGISTER}),\s*(?P<rs1>{REGISTER}),\s*(?P<rs2>{REGISTER})", re.I)
STORES = {"sb", "sh", "sw", "sd"}
LOADS = {"lb", "lbu", "lh", "lhu", "lw", "lwu", "ld"}


def same_address_pairs(lines, maximum_distance):
    parsed = []
    for lineno, line in enumerate(lines, 1):
        match = MEMORY.match(line.split("#", 1)[0])
        if match:
            parsed.append((lineno, match.group("op").lower(), match.group("addr"), line.strip()))
    pairs = []
    for index, store in enumerate(parsed):
        if store[1] not in STORES:
            continue
        for load in parsed[index + 1:index + maximum_distance + 2]:
            if load[1] in LOADS and load[2] == store[2]:
                pairs.append((store, load))
                break
    return pairs


def longest_alu_raw_chain(lines):
    parsed = []
    for lineno, line in enumerate(lines, 1):
        match = ALU.match(line.split("#", 1)[0])
        if match:
            parsed.append((lineno, match.group("rd").lower(),
                           match.group("rs1").lower(), line.strip()))
    if not parsed:
        return 0, []
    best = current = [parsed[0]]
    for item in parsed[1:]:
        if item[2] == current[-1][1]:
            current = current + [item]
        else:
            current = [item]
        if len(current) > len(best):
            best = current
    return len(best), best


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("assembly", type=Path)
    parser.add_argument("--expect", choices=["store-load-same-address", "alu-raw-chain"],
                        required=True)
    parser.add_argument("--minimum", type=int, default=1)
    parser.add_argument("--maximum-distance", type=int, default=2)
    args = parser.parse_args()
    lines = args.assembly.read_text(encoding="utf-8").splitlines()
    if args.expect == "store-load-same-address":
        pairs = same_address_pairs(lines, args.maximum_distance)
        if len(pairs) < args.minimum:
            raise SystemExit(f"FAIL: found {len(pairs)} matching pairs; expected at least {args.minimum}")
        print(f"PASS: found {len(pairs)} same-address store/load pairs")
        for store, load in pairs[:5]:
            print(f"  lines {store[0]}->{load[0]}: {store[3]} | {load[3]}")
    else:
        length, chain = longest_alu_raw_chain(lines)
        if length < args.minimum:
            raise SystemExit(f"FAIL: longest ALU RAW chain is {length}; expected at least {args.minimum}")
        print(f"PASS: found ALU RAW chain of length {length}")
        for item in chain:
            print(f"  line {item[0]}: {item[3]}")


if __name__ == "__main__":
    main()
