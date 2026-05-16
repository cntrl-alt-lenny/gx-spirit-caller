### decomper/c24-w3-c26-application

**Goal:** Two-part wave continuing the brief 101 → 102
chain at wave 3 (final cap of the self-extend clause) +
opening up the brief 100 C-26 recipe at scale.

**Part 1 — C-24 wave 3 (self-extend, final):**

Brief 102 wave 2 cleared both gates (13 / 648 / 68%);
wave 3 is the chain cap. Remaining 49-pool pool: ~13
candidates (49 minus brief-101's 17 minus brief-102's 19,
accounting for the 5 brief-101 reg-alloc-blocked already
deferred). With **brief 102's routing-tier insight**
(`lr`-as-scratch isn't sp3-exclusive), the wave 3 recipe
matrix is broader than brief 099 originally scoped — try
default `.c` first per the brief 100 NEGATIVE methodology.

**Part 2 — C-26 strict-signature wave:**

Brief 100 (PR #497) confirmed C-26 (critical-section +
helper-signature mismatch) applies when the helper's
first non-prologue instruction overwrites r0 — declare
helper as no-arg in C source, route caller via
`*.legacy.c`. 125 unmatched candidates have the
OS_Disable/Restore pair; the strict subset where helper
overwrites r0 first instruction is the actually-walled
sub-pool. Brief 100 named 1 confirmed strict match
(`func_020919d8`) + flagged that per-function helper-body
inspection is required.

Wave-2 scope: 8-10 candidates from brief 100's helper-
sig identified subset. Inspect each candidate's helper
function's first non-prologue instruction:

- If helper's first non-prologue insn writes r0 (e.g.
  `ldr r0, [pc, #...]` or `mov r0, #N`) → C-26 strict
  signature applies. Try natural form FIRST (per brief
  100 NEGATIVE rule); if natural fails, declare helper
  as no-arg + route caller via `*.legacy.c`.
- If helper reads r0 (`add r0, r0, #N` or `mov rN, r0`)
  → r0 is a real arg. C-26 doesn't apply; try natural
  form or skip.

**Method:**

1. **Pool generation for both parts.**

   - C-24 wave 3: remaining 49-pool candidates not yet
     attempted in waves 1+2.
   - C-26 wave: cross-corpus scan for OS_Disable/Restore
     pair + helper-first-insn-writes-r0 signature.
     Brief 100's notes name `func_020919d8` as the
     strict exemplar; cloud's brief 100 PR may have
     more candidates listed.

2. **Per-candidate workflow** — same as brief 101 / 102:
   write source, add delinks.txt entry, `ninja rom`,
   verify byte-identical, etc.

3. **Per brief 100 NEGATIVE methodology** — try natural
   form first for ALL candidates. Three NEGATIVE
   findings in a row (briefs 100 / 102 / 103) say the
   classification frequently outpaces the actual wall.

4. **Recipe refinements** from brief 101 still apply
   forward: `flags |= mask` for dedup, fn-ptr hoist
   before conditional branch, `do{}while` shape
   preference.

**Self-extend clause:** This is wave 3 of the C-24
chain — **chain cap**. No further self-extend on the
C-24 side. C-26 is wave 1 of its own chain — could
self-extend once if gates fire (yield ≥40% + bytes ≥250
on the C-26 portion alone).

**Non-scope:**

- ❌ Permuter sweeps. P-class candidates skip-listed.
- ❌ Walls beyond C-24 and C-26.
- ❌ Cross-region apply for the new matches (await
  accumulation; cross-region wave is brief 106+
  candidate).
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- **Part 1 (C-24 wave 3):** ≥ 3 byte-identical (lower
  bar than waves 1+2 since easier candidates already
  consumed).
- **Part 2 (C-26 wave 1):** ≥ 4 byte-identical at the
  strict sub-pool.
- **Combined:** ≥ 7 EUR matches, ≥ 250 bytes.
- All 3 regions stay at 24/27 baseline.
- Per-wave PR with funnel + per-candidate table flagging
  C-24 vs C-26 + natural-form attempt outcomes.

**Branch:** `decomper/c24-w3-c26-application`

**After this brief lands:**

1. **C-24 chain (101+102+104) closes.** Cumulative
   matches across the chain: 25 from brief 101+102, plus
   brief 104's Part 1. Brain queues brief 106 as
   cross-region apply for the chain output (~30-40 EUR
   ports × 2 regions = ~60-80 region landings).
2. **C-26 wave 1 outcome calibrates next move.** Strong
   yield → brief 107 as C-26 wave 2 on the broader 125-
   candidate pool. Weak yield → C-26 stays applicable
   only on the strict sub-pool; brain pivots to other
   patterns.
3. **Cloud brief 105 (permuter vs P-9) runs in parallel**
   — if it recovers any P-9 candidates, brief 108 as
   codification follows.
