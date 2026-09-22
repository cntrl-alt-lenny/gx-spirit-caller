### decomper/single-region-cap-raise-0x80

**Goal:** Continue the EUR hard-tier cap-raise trajectory:
brief 081 (≤0x40, 21 matches / 876 bytes) → brief 086
(≤0x60, 21 matches / 1440 bytes) → **brief 092 (≤0x80)**.
Target: another wave of 10-15 matches in the 0x60-0x80
band, leveraging the asm-discriminator skip-list brief 091
surfaced.

**Context — why ≤0x80 next:**

Brief 086 ran 80% / 82% / 25% yield across waves 1/2/3.
The drain to 25% at wave 3 was the upper-edge signal at
≤0x60. Brief 091's classification pass on the wave 3
failures showed those weren't C-22 (the wall brief 084
codified) — they were P-N (mwcc-2.0 modulo peephole) and
P-4 (reg-alloc swap). **Neither has a source-form recipe.**
Skipping them pre-emptively recovers iteration budget for
the new 0x60-0x80 band.

The cap-raise pattern has paid 1.6× across 081 → 086 at
constant match count. ≤0x80 doubles the addressable
function pool again (per the address-range distribution
from earlier briefs).

**Method (per brief 086 / 081 pattern):**

1. **Pool generation.** Enumerate unmatched EUR
   `src/main/*.c` candidates in 0x60-0x80 size band via
   `dsd report` + `objdiff-cli` filter. Target wave 1 size:
   12-18 candidates pre-filter.

2. **Skip-list filters** (apply BEFORE selection — brief
   091 calibration):

   - **P-N (signed-modulo peephole)** — asm signature:
     `mov rN, lsr #31` followed by `rsb rM, ..., lsl #27`
     followed by `add ..., ror #27` triplet. If the orig
     emits this 3-insn sequence anywhere, skip the
     candidate. mwcc 2.0 emits `and rN, #0x1f` instead,
     and `.legacy.c` (1.2/sp2p3) emits the formula but
     with different register allocation throughout — no
     recipe recovers byte-identical.

   - **P-4 family (reg-alloc swap)** — asm signature:
     orig allocates `&ctx` → r5 (higher-numbered) and
     `idx` → r4 (lower-numbered), opposite of mwcc 2.0's
     usage-order allocator. Pre-emptive check: if the
     orig has `mov r5, r0` early followed by `mov r4, r1`
     (lower-N from second arg), it's the P-4 shape. Skip
     and defer to brief 093 (permuter run).

3. **Selection — apply briefs 084 / 088 / 091 recipes
   forward:**

   - **C-22 (bitfield-via-union)** — when orig shows
     `bic` / `orr` pairs on adjacent struct words, declare
     the field as a bitfield-via-union with explicit
     widths (`u32 a : 4; u32 b : 4;` etc.).
   - **C-23 (.legacy.c routing)** — when orig shows
     base-folding (`ldr rN, =MMIO_BASE; ldr/str rM, [rN]`)
     OR `ANDS r0, r1, #imm; bne` patterns, route the TU
     via `.legacy.c`.
   - **S-2a (signed loop counter)** — already folded into
     S-2 (PR #479); apply forward.
   - All earlier recipes (C-1 through C-21) remain
     applicable.

4. **Wave cadence** — same as briefs 081 / 086:
   - Wave 1: 10-15 candidates. Target ≥40% yield ≥250
     bytes for self-extend trigger.
   - Wave 2 + 3 self-extend if gate fires. Cap at 3 waves.
   - Per-wave PR with funnel + yield + byte-distribution
     table.

**Non-scope:**

- ❌ Cross-region apply (waits for cap-raise pool to
  accumulate — brief 094-or-later candidate).
- ❌ Brief 091's P-N / P-4 candidates (skip-listed).
- ❌ Pokeheartgold drift-port (brief 082 v2 stays
  de-prioritized).
- ❌ AGENTS.md / state.md edits.

**Success:**

- ≥ 10 EUR matches in wave 1.
- ≥ 40% yield, ≥ 250 bytes (self-extend gate).
- All 3 regions stay 24/27 baseline (only EUR sources
  edited, but `dsd check modules` should still pass on
  USA + JPN if untouched).
- Per-PR funnel + size-distribution table.
- If wave 1 yield falls in 40-60% range, self-extend
  triggers wave 2; ≥80% means strong pool depth, wave 3
  likely.

**Branch:** `decomper/single-region-cap-raise-0x80`

**Self-extend clause:** Same as brief 086 — up to 2
follow-up waves if gate is met. Cap at 3 waves total.
Mid-band yields (40-60%) trigger 1 follow-up; high
yields (≥70%) trigger 2.

**After this brief lands:**

1. If chain delivers ≥30 matches cumulative, brain queues
   brief 094 — cross-region apply of the new pool to
   USA + JPN (brief 090 pattern). With brief 091's skip-
   list + brief 064 D2 v2 (auto-promote LOW→MEDIUM),
   conversion rate should match or exceed brief 090's 78%.
2. If chain delivers fewer matches, brain pivots to either
   pokeheartgold drift-port retry or medium-tier follow-on.
3. Permuter outcomes from brief 093 may unlock recovery
   of the previously-skipped P-4 family — fold into a
   future wave if recipe lands.
