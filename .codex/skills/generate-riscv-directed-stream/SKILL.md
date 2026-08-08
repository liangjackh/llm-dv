---
name: generate-riscv-directed-stream
description: Generate, integrate, and test new Python pygen directed instruction stream classes in this riscv-dv repository from natural-language verification pattern requirements. Use when Codex needs to implement a new randomized instruction pattern, extend riscv_directed_instr_stream or riscv_mem_access_stream, register a generated stream with pygen, create its parameter and test configuration, run generation, repair failures, or report evidence that the requested instruction sequence was emitted.
---

# Generate RISC-V Directed Stream

Turn a verification intent into a new, parameterized pygen generator class and prove that it emits the requested pattern. Generate generator code, not a fixed assembly testcase.

## Workflow

1. Inspect the repository state and preserve unrelated user changes. Place generated pattern modules under `pygen/pygen_src/llm_patterns/` unless the user chooses another extension directory.
2. Convert the request into a concrete requirement before designing classes. For a high-level or ambiguous intent, read `references/requirement-elaboration.md` and run `scripts/elaborate_requirement.py`; preserve the raw request, mark inferred values by source, and separate assumptions from unresolved DUT facts. Continue automatically when `review.blocking` is false, but report the assumptions. Stop before code generation when it is true. For an already detailed request, record the same sequence semantics, random dimensions, target ISA/XLEN, forbidden resources, runtime parameters, seed, and assembly acceptance checks using `assets/pattern_requirement.yaml` as the shape.
3. Read `references/pygen-extension-api.md` completely. For a memory pattern, also inspect the current `riscv_mem_access_stream` and closest classes in `riscv_load_store_instr_lib.py`; otherwise inspect the closest directed stream. Treat repository code as authoritative.
4. Produce `design.yaml` before code. Declare the entry class, every generated helper/base class, each direct parent, responsibilities, source module, and the existing pygen root reached by the inheritance graph. Run `scripts/validate_design.py` before implementation. Allow a generated parent when the request contains reusable behavior; do not force memory patterns or unrelated patterns through `riscv_mem_access_stream`.
5. Implement the designed module set from `assets/directed_stream_template.py`. Reuse pygen instruction objects, randomization, reserved-register rules, and parent lifecycle. Do not emit assembly strings directly unless an existing API requires them. Register only the concrete entry class.
6. Keep user-tunable values in a small JSON or YAML configuration consumed by the generated module. The existing `+directed_instr_n=name,ratio` interface carries only class name and insertion ratio.
7. Integrate explicitly. Import the entry class and add it to `factory()` in `pygen/pygen_src/riscv_utils.py`, or use an existing project plugin registry. Do not replace unrelated entries or register abstract/generated base classes.
   - Preview with `scripts/integrate_factory.py --utils PYGEN_UTILS --module MODULE --class-name CLASS --check`.
   - Apply only after direct smoke testing with the same command plus `--apply` instead of `--check`.
8. Generate a dedicated testlist entry with a fixed seed using `scripts/generate_testlist.py REQUIREMENT OUTPUT`. Use `pyflow`, the selected target, and `--steps gen` when supported.
9. Validate in increasing cost order:
   - Run `scripts/validate_design.py DESIGN`.
   - Run `scripts/validate_pattern.py MODULE --class-name CLASS --base-class BASE --config CONFIG`.
   - Compile and import the module in the real pygen environment.
   - Run `scripts/smoke_test_pattern.py --repo-root REPO --module MODULE --class-name CLASS --target TARGET --seed SEED` to initialize the instruction registry, instantiate the entry class directly, call `randomize()`, and render its assembly.
   - Instantiate through `factory(CLASS)` after registration.
   - Run `run.py --steps gen`.
   - Run `scripts/inspect_asm.py ASM --expect store-load-same-address` or add a requirement-specific checker.
10. Classify failures as design, syntax, import/API, constraint solve, integration, assembly generation, or intent mismatch. Repair the smallest responsible artifact and rerun from the failed level.
11. Report requirement, generated class graph, parameters, changed files, exact command/seed, validation results, and representative assembly evidence. Never claim semantic success from syntax checks alone.

## Guardrails

- Prefer a new module over appending generated code to large library files.
- Permit direct inheritance from an existing stream, inheritance from a generated parent, or a mixed multi-module hierarchy. Require the entry class to reach one approved pygen stream root through an acyclic graph.
- Reject nonexistent instruction enum names and unsupported ISA combinations before generation.
- Exclude `ZERO` and `cfg.reserved_regs` where writable GPRs are required.
- Preserve address and dependency relationships explicitly; do not rely on coincidence.
- Inspect the closest working class before deciding how to call parent lifecycle methods.
- Use fixed seeds for demonstrations and retain the requirement/config beside results.
- Limit automated repair attempts to three unless the user requests continued iteration.

## Resources

- `references/requirement-elaboration.md`: high-level intent expansion, provenance, assumptions, and BPU pressure rules.
- `references/pygen-extension-api.md`: inheritance, lifecycle, factory, and invocation contract.
- `references/acceptance-checks.md`: validation levels and reporting standard.
- `assets/pattern_requirement.yaml`: requirement template.
- `assets/pattern_design.yaml`: multi-class inheritance design template.
- `assets/directed_stream_template.py`: starting skeleton, not a complete pattern.
- `scripts/elaborate_requirement.py`: deterministic high-level intent expansion with a BPU profile and generic blocked fallback.
- `scripts/validate_pattern.py`: dependency-free AST and configuration validator.
- `scripts/validate_design.py`: dependency-free class graph and entry-point validator.
- `scripts/smoke_test_pattern.py`: real pygen import, direct construction, randomization, and assembly smoke test.
- `scripts/integrate_factory.py`: idempotently check or add one entry-class import and factory mapping.
- `scripts/generate_testlist.py`: deterministically materialize a pygen testlist from a requirement.
- `scripts/inspect_asm.py`: assembly checker for existing data-dependency demonstrations.
- `scripts/inspect_bpu_asm.py`: pattern-scoped checker for architecture-independent BPU branch sites, targets, call/return pairs, labels, and block termination.
