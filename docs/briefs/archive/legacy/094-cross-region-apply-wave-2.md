### decomper/cross-region-apply-wave-2

**Goal:** Apply `tools/port_to_region.py` to the EUR
`src/main/*.c` matches accumulated since brief 090
shipped. Brief 090 wave 1 covered 33 of the 39-port pool
it sampled from briefs 081 + 086; brief 092 added 1 more
match (`func_02005bfc`). **Cross-region apply is now the
highest-leverage forward move** per brief 092's cap-raise
floor signal — the single-region pool depth is exhausted
at ≤0x80, but the existing matches still convert ~75% to
USA + JPN per brief 090's calibration.

**Context — what's available:**

Per brief 090's accounting:

- 39 EUR src/main pool sampled
- 33 byte-identical landings × 2 regions = 66 already
  shipped
- 2 refused (legacy_sp3 data-symbol resolution gap —
  candidate for cloud brief 095 D3)
- 4 unaccounted for (verify via the brief 090 PR body
  funnel + the addressed file list)

Brief 092 wave 1 added 1 new EUR match: `func_02005bfc`.

**Estimated pool for wave 2:** Decomper's PR #486 estimate
was "43 EUR ports brief 090 didn't cover" — confirm
empirically via:

```bash
# All EUR src/main funcs in tree NOT covered by USA + JPN
comm -23 \
    <(ls src/main/func_*.c | sed 's:.*/::; s:\..*::' | sort -u) \
    <(ls src/usa/main/func_*.c | sed 's:.*/::; s:\..*::' | sort -u)
```

The set difference is the actionable cross-region pool.
Filter further:

- Skip trivial-byte stubs (size ≤ 0x10) — brief 075
  calibration says these can't cross-region apply.
- Skip the 2 brief-090 legacy_sp3 refusals (await brief
  095 D3).

**Method (unchanged from brief 090):**

1. **Generate the pool** via the `comm` command above.
2. **Per-port workflow:**

   ```bash
   python tools/port_to_region.py src/main/<port>.c --target usa --confidence-floor LOW
   python tools/port_to_region.py src/main/<port>.c --target jpn --confidence-floor LOW
   python tools/configure.py usa && ninja rom
   python tools/configure.py jpn && ninja rom
   # verify 24/27 baseline preserved
   ```

3. **Batch 8-12 ports per batch**, verify after each
   batch. Track per-port outcome (byte-identical /
   byte-diff / refused).

4. **Skip-list:**
   - Tool-refusal (D1 v2 ambiguous-callee or D2 v2
     reloc-aware byte mask — already in place).
   - Trivial-byte stubs (size ≤ 0x10).
   - The 2 brief-090 legacy_sp3 lazy-init thunks.

**Calibration to track:**

Brief 090 paid 78% on substantive (≥0x20) functions
with LOW-floor. This wave 2 pool will likely have a
similar shape distribution. **Track:**

- Per-port: HIGH / MEDIUM / LOW confidence at port_to_
  region.py output. Compare against brief 064 D2 v2
  (cloud brief 095) auto-promote rule if it lands first
  — should reduce LOW-floor invocations to MEDIUM
  pre-promotions.
- Per-port: byte-identical / byte-diff / refused.
- New refusal modes (anything novel beyond brief 090's
  legacy_sp3 data-symbol gap).

**Scope:**

- Apply 30-50 of the estimated 43-port pool to USA + JPN
  combined (each EUR match attempts both regions).
- Target byte count: ≥ 60% of the EUR-pool bytes per
  region.
- All 3 regions stay at 24/27 baseline.

**Non-scope:**

- ❌ Re-attempting brief-090 refusals (await brief 095
  D3 unless decomper finds a workaround mid-wave).
- ❌ Cross-project ports (libs/nitro/*.legacy.c) — that's
  the cross_apply_libs_port.py pipeline, separate brief.
- ❌ AGENTS.md / state.md edits beyond the wave PR.
- ❌ New single-region matches (brief 092 closed the
  cap-raise chain; no new EUR work until cloud brief 095
  D2 v2 + a future single-region revisit).

**Success:**

- ≥ 25 EUR matches × 2 regions = ≥ 50 region-landings
  applied.
- All 3 regions at 24/27 baseline.
- USA + JPN README badges climb from 0.34% to roughly
  0.45-0.55% each (depends on the byte distribution of
  the new wave 2 pool — typically larger than wave 1
  since wave 1 cherry-picked smaller HIGH-confidence
  candidates first).
- PR body funnel matches brief 090's structure: pool
  → confidence-floor distribution → byte-identical /
  byte-diff / refused split.

**Branch:** `decomper/cross-region-apply-wave-2`

**No self-extend clause** — this is a one-time backfill
for the brief 081 + 086 + 092 accumulation that wasn't
in brief 090's pool. If results substantially below 25
ports, hand back to brain for re-scoping (likely
indicates the wave 2 pool is shape-different from wave 1).

**After this brief lands:**

1. USA + JPN badges climb again — second sustained
   multi-region growth wave.
2. Brain scopes the next move based on cumulative data:
   - **Permuter wrapper (brief 096)** if cloud brief 095
     also landed — unblocks future P-class work.
   - **Medium-tier follow-on single-region wave** —
     project is ~80% matched; medium-tier has remaining
     candidates that the cap-raise chain didn't reach.
   - **Cross-project pipeline revisit** if brief 095 D3
     unlocks data-symbol parallel-reloc resolution
     (could re-open pokeheartgold drift-port viability).
