# Acceptance checks

## Required levels

1. **Requirement**: names are snake_case, ranges are ordered, insertion ratio is 1..1000, and acceptance rules are measurable.
2. **Design**: entry class exists; generated class/module names are unique; every parent resolves; inheritance is acyclic; the entry reaches an approved pygen root; exactly the entry class is registered.
3. **Source contract**: Python parses; designed classes exist; direct parents match; the entry defines or inherits the required lifecycle; imports pygen APIs; and constructs `instr_list`.
4. **Integration**: class imports and constructs through `factory()`.
5. **Randomization**: fixed-seed `randomize()` returns a non-empty instruction list.
6. **Generation**: pygen produces `.S` without constraint or generation errors.
7. **Intent**: an automated checker finds the requested relationship in assembly.

Report `PASS`, `FAIL`, and `NOT RUN` separately. A lower-level pass never implies a higher-level pass.

## Store-load same-address PoC

Accept a pair only when a store and later load use the same textual `offset(base)` operand within the configured maximum distance. Count pairs and require the configured minimum. If loaded-value consumption is required, also confirm that a subsequent instruction reads the load destination register.
