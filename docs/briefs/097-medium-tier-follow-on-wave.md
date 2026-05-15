### decomper/medium-tier-follow-on-wave

**Goal:** Run a medium-tier follow-on single-region wave
against the EUR baseline. The cross-region apply pool is
now drained (brief 094 wave 2 backfilled 311 of 375
residual ports); the cap-raise lever is floored at ≤0x80
(brief 092). **Medium-tier follow-on is the next natural
forward pool** — modules currently at ~80% matched have
remaining candidates that the cap-raise + cross-region
waves didn't reach.

**Context — why medium-tier next:**

- Cap-raise trajectory: 081 (≤0x40, 67.7% yield) → 086
  (≤0x60, 63%) → 092 (≤0x80, 20% — floor). The single-
  region EUR cap-raise lever is drained for the size
  band that current source-form recipes cover.
- Cross-region: brief 094 wave 2 cleaned the residual
  pool that accumulated through briefs 057-092.
- Medium-tier hasn't been worked since earlier briefs
  (`decomper/medium-tier-wave-1` through `medium-tier-
  wave-7` ran much earlier in the session). The C-22 /
  C-23 / S-2a recipes added since then haven't been
  applied to the medium-tier residual.

**Method (per `medium-tier-wave-*` precedent):**

1. **Pool generation.** Enumerate unmatched candidates
   in modules currently at ~80% matched. Use
   `dsd report` filtering by per-module match-rate. Target
   wave 1 size: 8-12 candidates.

2. **Apply forward.** Inherit all current coercion
   recipes:
   - C-1 through C-21 (existing).
   - **C-22 bitfield-via-union** (brief 084 + 086 wave 3
     production hit).
   - **C-23 `.legacy.c` routing** (brief 088 — base-
     folding + ANDS→TST peepholes).
   - **S-2a signed loop counters** (brief 079 / PR #479).
   - **Skip-list:** P-N (signed-modulo peephole), P-4
     family (reg-alloc swap), all other permanent walls
     P-1 through P-8.

3. **Wave cadence** — same as briefs 081 / 086 / 092:
   - Wave 1: 8-12 candidates. Self-extend if gate fires.
   - Wave 2 + 3 if gate met. Cap at 3 waves.

4. **Track shape distribution.** Medium-tier candidates
   tend to be **shape-diverse** (more callee variety,
   more pattern types) than the cap-raise candidates that
   share size constraints. **Document new wall datapoints
   carefully** — likely candidates for future C-24 or W-
   class entries.

5. **Self-extend gate:** yield ≥ 40% AND bytes ≥ 250.
   Same threshold as briefs 081 / 086 / 092.

**Non-scope:**

- ❌ Re-running cross-region apply (brief 094 drained the
  pool; next cross-region wave waits for new EUR matches
  to accumulate).
- ❌ The 3 brief-094 byte-diff drops or 64 unrecovered
  ports — those are candidates for brief 098+ permuter
  sweep (after brief 096 wrapper lands).
- ❌ Cross-project (pokeheartgold) drift-port — still
  DE-PRIORITIZED.
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- ≥ 5 EUR medium-tier matches in wave 1 (lower bar than
  cap-raise since medium-tier shapes are more diverse).
- ≥ 40% yield, ≥ 250 bytes (self-extend gate).
- All 3 regions stay at 24/27 baseline.
- Per-wave PR with funnel + size distribution + per-
  candidate wall classification (new datapoints
  flagged for codegen-walls.md).
- New EUR matches accumulate for a future brief 099 or
  100 cross-region apply wave.

**Branch:** `decomper/medium-tier-follow-on-wave`

**Self-extend clause:** Same as brief 086 / 092 — up to 2
follow-up waves if gate is met. Cap at 3 waves total.
Mid-band yields (40-60%) trigger 1 follow-up; high
yields (≥70%) trigger 2.

**After this brief lands:**

1. New EUR matches accumulate for future cross-region
   apply. With brief 095 D2 v2 + D3 in place, the next
   cross-region wave should run cleanly without manual
   confidence-floor overrides.
2. New wall datapoints (if surfaced) feed cloud's
   codegen-walls research backlog.
3. **Brief 098 candidate** — if brief 096 permuter
   wrapper landed in parallel, brain queues a permuter
   sweep against brief 091's P-N candidate
   (`func_02009758`) or the 3 brief-094 byte-diff drops.
4. **Brief 099 candidate** — if shape distribution of
   medium-tier failures surfaces a new wall family with
   ≥ 3 datapoints, codegen-sweep brief in the 084/088/091
   pattern is queued for cloud.
