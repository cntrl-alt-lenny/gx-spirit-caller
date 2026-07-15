[//]: # (moved verbatim from AGENTS.md 2026-07-15 — Codex 32KB instruction-cap diet)
[//]: # (roster snapshots here are era-specific; the CURRENT roster lives in AGENTS.md § Open briefs LANE STATE)

### Model notes (Fable 5 / Opus 4.8 mix)

Sessions run whichever frontier model is at hand; the workflow must
not depend on which. Standing posture:

- **Opus 4.8 is the calibration floor.** Wave targets, time-boxes,
  and gates are tuned to 4.8. Fable 5's gains (FrontierCode ~2.2×
  4.8, near-zero lazy-investigation / confidently-wrong rates,
  stronger 1M-context reasoning) are **upside — spend them on stretch
  goals, never bake them into a brief's success bar.**
- **Fable 5 cyber-classifier fallback is expected behavior, not a
  bug.** Binary reconstruction is in the activity category Fable 5's
  safety classifiers can block (its card declines to report
  ProgramBench for Fable for exactly this reason, §8.6); flagged
  conversations silently fall back to Opus 4.8 for the rest of the
  trajectory (§3.1.2). A decomp session on Fable 5 may therefore
  effectively BE a 4.8 session on RE-heavy stretches. Do **not**
  re-prompt or restructure work to evade a refusal/degradation —
  that is the cards' "safeguard circumvention" failure tag. Note it
  in the PR body and continue; the floor calibration already covers
  it. Tooling, coordination, and synthesis work has no RE surface
  and gets full Fable 5.
- **Effort discipline.** Think hard at diagnosis / classification /
  routing / merge moments; stay fast on grind picks. Test-time
  compute is the largest quality knob on both cards (FrontierCode
  11.5 → 29.3 % low→xhigh effort).
- **Session and context persistence.** Prefer continuing an agent's
  existing session across consecutive waves of the same lane
  (long-lived context measurably beats fresh-spawn re-derivation;
  the `core.h` banks remain the durable backup). On a 1M-context
  model, whole-cohort passes — an overlay's full residue + core.h
  in one context for batch classification — are encouraged where
  they remove per-pick re-reads.
- **Subagent fan-out is for the hard tail only.** Multi-agent gains
  concentrate on hard problems (~1.6× median speedup there, ~0.8× on
  easy ones — the coordination overhead loses on the grind tiers).
  Analysis-only subagents; the lead serialises all builds (parallel
  `ninja` in one checkout collides).

#### Per-role model recommendation (decided 2026-06-14, grounded)

The deterministic 3-region `ninja sha1` gate means **a weaker model
cannot ship a wrong answer — only fewer answers** (more skips/retries).
Model choice on the mechanical lanes therefore trades *throughput*, not
*correctness*. Evidence: briefs 412+413 ran **entirely on Sonnet 4.6
Max** (brain + both agents) → **310 byte-identical ships, 3-region gate
green, agents independently found+fixed 2 real bugs** (ov011 delinks
parse bug; correct asm-fail triage). Cost fact: Opus 4.8 ($5/$25 per
Mtok) is only **~1.67× Sonnet 4.6** ($3/$15), not the historical ~5× —
so the gap is low-stakes; pick by capability-fit, not cost.

- **Scaffolder → Sonnet 4.6 Max** (permanent). Pure mechanical,
  gate-protected `.s` grind; `asm_escape` commoditised it. No measurable
  Opus benefit. (If pushing cost further: the pure grind is the one
  place Haiku 4.5 *could* be piloted — but pilot it, don't assume it;
  Haiku is 200K-context, and these are long multi-wave sessions.)
- **Decomper → Sonnet 4.6 Max for mechanical/sweep rounds; Opus 4.8 Max
  for understanding-bound RE rounds** (the brief-405/415 giant-
  reconstruction profile). Tag each decomper brief with the model.
- **Brain → Opus 4.8 Max** (the one retained premium). Cheapest seat to
  keep on Opus (one session, low token volume vs. the grind) and the
  highest-leverage for judgment (routing, cross-agent claim re-verify,
  merge gating) — the long-context regime where the cards' diligence
  edge matters most. **Insurance, not necessity**: brain-on-Sonnet ran
  clean this round; the gate catches anything load-bearing.
- **Fable 5: skip for the decomp RE lanes.** Its cyber-classifier
  fallback (above) silently drops binary-reconstruction trajectories to
  4.8 anyway, so its 2× (vs 4.8) / 3.3× (vs Sonnet) premium buys nothing
  on RE turns. Marginal for the brain (no RE surface, but a low-volume
  seat — only if max judgment matters and cost is no object).

