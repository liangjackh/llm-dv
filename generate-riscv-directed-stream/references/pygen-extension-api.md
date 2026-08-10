# Pygen directed-stream extension API

## Repository integration map

- `pygen/pygen_src/riscv_directed_instr_lib.py` defines `riscv_directed_instr_stream` and `riscv_mem_access_stream`.
- `pygen/pygen_src/riscv_load_store_instr_lib.py` contains concrete memory stream examples.
- `pygen/pygen_src/riscv_utils.py:factory()` maps a string to a constructor. New classes are not discovered automatically.
- `pygen/pygen_src/riscv_asm_program_gen.py:get_directed_instr_stream()` parses `+directed_instr_N=CLASS,RATIO`.
- `generate_directed_instr_stream()` calls `factory(CLASS)`, sets `name`, `hart`, `label`, and `kernel_mode`, calls `randomize()`, and inserts `instr_list`.

## Inheritance selection

- Extend `riscv_directed_instr_stream` for general atomic directed sequences.
- Extend `riscv_mem_access_stream` for sequences requiring configured memory regions or `add_rs1_init_la_instr()`.
- Extend a specialized stream only when its invariants match the request.
- Generate a new intermediate parent when two or more concrete patterns share configuration, register selection, dependency construction, or acceptance instrumentation. Record all generated classes in `design.yaml`; register only its entry class.

The entry class may span multiple generated modules. Its parent chain must be acyclic and must eventually reach one approved existing root: `riscv_instr_stream`, `riscv_rand_instr_stream`, `riscv_directed_instr_stream`, or `riscv_mem_access_stream`. Reaching the latter two roots is preferred for directed patterns; accepting the broader roots accommodates existing repository classes with different inheritance choices.

## Lifecycle contract

1. Define random fields in `__init__()` using conventions from nearby classes.
2. Populate memory-region state in `pre_randomize()` and call the appropriate parent.
3. Construct `riscv_instr` or `riscv_pseudo_instr` objects in `post_randomize()`.
4. Append them in semantic order to `instr_list`.
5. Call the relevant parent `post_randomize()` when it supplies required labels, comments, or atomic flags.
6. Ensure the list is non-empty before calling `riscv_directed_instr_stream.post_randomize()` because it accesses first and last items.

## Parameters

The stock CLI supplies only class name and insertions per 1000 instructions. For a PoC, store pattern-specific parameters in sidecar YAML/JSON and load them deterministically. Validate it before importing pygen. Keep class defaults so a factory smoke test can instantiate without external state.

## Registration

Add an explicit import and mapping entry to `riscv_utils.py:factory()`:

```python
from pygen_src.llm_patterns.example import riscv_llm_example_stream

objs = {
    # existing entries...
    "riscv_llm_example_stream": riscv_llm_example_stream,
}
```

Keep registration edits minimal. A production version may add plugin discovery, but the PoC should favor transparent behavior.

## Invocation

```yaml
gen_test: riscv_instr_base_test
gen_opts: >
  +instr_cnt=500
  +directed_instr_0=riscv_llm_example_stream,20
iterations: 1
```

Use a fixed seed and `--steps gen` first. Check emitted assembly for the semantic relationship, not merely mnemonic presence.
