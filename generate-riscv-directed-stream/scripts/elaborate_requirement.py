#!/usr/bin/env python3
"""Expand a high-level verification intent into structured requirement YAML."""
import argparse
import re
from pathlib import Path

BPU_TERMS = ("bpu", "btb", "bht", "pht", "ras", "branch predictor",
             "branch prediction", "分支预测", "分支预测器")

def yaml_module():
    try:
        import yaml
    except ImportError as exc:
        raise SystemExit("PyYAML is required") from exc
    return yaml

def parse_target(target):
    match = re.fullmatch(r"rv(32|64)([a-z]+)", target.lower())
    if not match:
        raise SystemExit("FAIL: target must look like rv32imc or rv64imafdc")
    extensions = list(dict.fromkeys(match.group(2).upper()))
    if "I" not in extensions:
        raise SystemExit("FAIL: target must include the base I extension")
    return int(match.group(1)), extensions

def bpu_requirement(args, xlen, extensions):
    sites = args.branch_sites or 64
    targets = args.unique_targets or max(16, sites // 2)
    return {
        "schema_version": 1,
        "generation_mode": "architecture_independent",
        "name": "riscv_llm_bpu_capacity_pressure_stream",
        "description": "Generate control-flow pressure with many unique branch PCs and targets.",
        "intent": {"raw": args.intent, "profile": "bpu_capacity_pressure",
                   "interpretation": "Exercise BTB, conditional-outcome, and safe call/return capacity proxies."},
        "target": {"pygen_target": args.target, "xlen": [xlen],
                   "required_extensions": extensions, "privilege_modes": [args.privilege_mode]},
        "sequence": {
            "semantics": "Emit many distinct static control-flow sites with terminating paths.",
            "branch_sites": sites, "unique_targets": targets,
            "branch_types": {"conditional": True, "direct_jump": True,
                             "call_return": True, "indirect_jump": False},
            "conditional_outcome_mix": ["taken", "not_taken"]},
        "parameters": {"branch_distance": {"min": 1, "max": args.maximum_branch_distance},
                       "randomize_registers": True, "randomize_block_order": True,
                       "randomize_branch_distance": True},
        "constraints": {"forbidden_registers": ["ZERO", "cfg.reserved_regs"],
                        "forbidden_instructions": [], "forbidden_addresses": [],
                        "preserve_control_flow": True, "ensure_termination": True},
        "runtime": {"insertion_ratio": args.insertion_ratio,
                    "instruction_count": args.instruction_count, "iterations": 1, "seed": args.seed},
        "acceptance": {"kind": "bpu-capacity-pressure",
                       "assembly_checks": {"minimum_unique_branch_pcs": sites,
                                           "minimum_unique_targets": targets,
                                           "require_conditional_branch": True,
                                           "require_direct_jump": True,
                                           "require_call_return": True,
                                           "require_terminating_path": True},
                       "claim_limit": "Assembly proves stimulus structure, not physical BPU occupancy."},
        "assumptions": [
            {"field": "sequence.branch_sites", "value": sites,
             "reason": "DUT predictor capacity was not supplied; use a demo pressure scale."},
            {"field": "sequence.branch_types", "value": "conditional+direct_jump+call_return",
             "reason": "BPU was not narrowed to BTB, history predictor, or RAS."}],
        "unresolved": [],
        "deferred": [
            {"field": "dut.btb_entry_count", "required_before": "dut_aware_capacity_claim", "status": "deferred"},
            {"field": "dut.bht_or_pht_entry_count", "required_before": "dut_aware_history_capacity_pattern", "status": "deferred"},
            {"field": "dut.ras_depth", "required_before": "dut_aware_ras_overflow_pattern", "status": "deferred"},
            {"field": "dut.predictor_index_function", "required_before": "dut_aware_alias_pattern", "status": "deferred"},
            {"field": "dut.predictor_update_policy", "required_before": "dut_aware_training_claim", "status": "deferred"}],
        "field_sources": {"intent.raw": "user_provided",
                          "target": "user_provided_and_repository_inferred",
                          "runtime.seed": "user_provided" if args.seed_explicit else "llm_assumed",
                          "sequence": "domain_profile_and_llm_assumed",
                          "constraints": "repository_inferred", "acceptance": "domain_profile"},
        "claim_scope": {
            "proves": ["configured control-flow stimulus structure was emitted", "generated control flow has a terminating path"],
            "does_not_prove": ["physical BPU occupancy", "prediction accuracy", "entry replacement"]},
        "review": {"status": "ready", "blocking": False,
                   "reason": "Architecture-independent generation does not require DUT microarchitecture parameters."}}

def generic_requirement(args, xlen, extensions):
    return {
        "schema_version": 1, "generation_mode": "architecture_independent", "name": "riscv_llm_unresolved_pattern_stream",
        "description": "Unresolved high-level verification intent.",
        "intent": {"raw": args.intent, "profile": "generic", "interpretation": args.intent},
        "target": {"pygen_target": args.target, "xlen": [xlen],
                   "required_extensions": extensions, "privilege_modes": [args.privilege_mode]},
        "sequence": {"semantics": None}, "parameters": {},
        "constraints": {"forbidden_registers": ["ZERO", "cfg.reserved_regs"],
                        "forbidden_instructions": [], "forbidden_addresses": []},
        "runtime": {"insertion_ratio": args.insertion_ratio,
                    "instruction_count": args.instruction_count, "iterations": 1, "seed": args.seed},
        "acceptance": {"kind": "unresolved", "assembly_checks": {}}, "assumptions": [],
        "unresolved": ["sequence.semantics", "parameters.randomization_dimensions",
                       "acceptance.assembly_checks"], "deferred": [],
        "field_sources": {"intent.raw": "user_provided",
                          "target": "user_provided_and_repository_inferred",
                          "constraints.forbidden_registers": "repository_inferred",
                          "runtime": "user_provided_and_llm_assumed"},
        "review": {"status": "blocked", "blocking": True,
                   "reason": "No domain profile matched; complete unresolved fields."}}

def validate(req):
    required = ("schema_version", "generation_mode", "name", "intent", "target", "sequence",
                "parameters", "constraints", "runtime", "acceptance", "assumptions", "unresolved",
                "deferred", "field_sources", "review")
    errors = [f"missing top-level field {key}" for key in required if key not in req]
    ratio = req.get("runtime", {}).get("insertion_ratio")
    if not isinstance(ratio, int) or not 1 <= ratio <= 1000:
        errors.append("runtime.insertion_ratio must be 1..1000")
    if not isinstance(req.get("runtime", {}).get("seed"), int):
        errors.append("runtime.seed must be an integer")
    if errors:
        raise SystemExit("\n".join(f"FAIL: {error}" for error in errors))

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--intent", required=True)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--target", default="rv32imc")
    parser.add_argument("--privilege-mode", default="MACHINE_MODE")
    parser.add_argument("--seed", type=int)
    parser.add_argument("--insertion-ratio", type=int, default=20)
    parser.add_argument("--instruction-count", type=int, default=500)
    parser.add_argument("--branch-sites", type=int)
    parser.add_argument("--unique-targets", type=int)
    parser.add_argument("--maximum-branch-distance", type=int, default=16)
    args = parser.parse_args()
    args.seed_explicit = args.seed is not None
    args.seed = 123 if args.seed is None else args.seed
    for name in ("instruction_count", "maximum_branch_distance"):
        if getattr(args, name) <= 0:
            raise SystemExit(f"FAIL: --{name.replace('_', '-')} must be positive")
    for name in ("branch_sites", "unique_targets"):
        if getattr(args, name) is not None and getattr(args, name) <= 0:
            raise SystemExit(f"FAIL: --{name.replace('_', '-')} must be positive")
    xlen, extensions = parse_target(args.target)
    matched = any(term in args.intent.lower() for term in BPU_TERMS)
    req = bpu_requirement(args, xlen, extensions) if matched else generic_requirement(args, xlen, extensions)
    validate(req)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(yaml_module().safe_dump(req, sort_keys=False, allow_unicode=True), encoding="utf-8")
    print(f"PASS: profile={req['intent']['profile']} review={req['review']['status']} output={args.output}")
    if req["unresolved"]:
        print("UNRESOLVED: " + ", ".join(req["unresolved"]))
    if req["deferred"]:
        print("DEFERRED: " + ", ".join(item["field"] for item in req["deferred"]))

if __name__ == "__main__":
    main()
