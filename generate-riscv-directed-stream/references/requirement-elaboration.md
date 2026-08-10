# Requirement elaboration

Use this reference when the user supplies a high-level verification intent instead of a complete pattern specification.

## Contract

Produce `requirement.yaml` before inheritance design or Python generation. Preserve the original text in `intent.raw`. Include `intent`, `target`, `sequence`, `parameters`, `constraints`, `runtime`, `acceptance`, `assumptions`, `unresolved`, `field_sources`, and `review`.

Never silently fill a microarchitecture-specific fact. Put it in `unresolved`. If a safe demonstration proxy exists, state it in `assumptions` and use `review.status: needs_review`. Use `blocked` when instruction semantics or assembly acceptance checks remain undefined.

Use these provenance values: `user_provided`, `repository_inferred`, `domain_profile`, and `llm_assumed`. Combined values may join them with `_and_`.

## BPU capacity-pressure profile

Interpret generic requests such as "fill the BPU" as stimulus pressure, not proof of physical occupancy:

- BTB: many unique static branch PCs and distinct targets.
- Conditional predictor: deterministic taken/not-taken history patterns.
- RAS: safe call/return sequences when supported.
- Indirect target prediction: include only when explicitly requested or safely designed.

Treat BTB/BHT/PHT entry counts, RAS depth, indexing, replacement, and update policies as unresolved unless supplied by a DUT specification. Assembly may prove site, target, instruction-kind, and terminating-path counts; it may not claim the BPU became full.

```bash
python3 scripts/elaborate_requirement.py \
  --intent "构造一个装满 BPU 的 pattern" \
  --target rv32imc --seed 123 \
  --output llm_generated/bpu_pressure/requirement.yaml
```

For an unmatched intent, the script emits a generic blocked skeleton. Complete its unresolved semantic and acceptance fields before continuing.

## Architecture-independent mode

Set `generation_mode: architecture_independent` when DUT analysis is intentionally deferred. Move DUT capacity, indexing, replacement, and update-policy facts to structured `deferred` entries. These do not block generator design. Set `review.status: ready`, retain explicit `claim_scope`, and never promote assembly evidence into a DUT behavior claim.
