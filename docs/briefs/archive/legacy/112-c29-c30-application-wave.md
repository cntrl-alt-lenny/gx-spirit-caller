### decomper/c29-c30-application-wave

**Goal:** First production application of brief 111's
two new recipes — **C-29** (`if (!p)` idiom for short-
tail early-return) and **C-30** (pool-DUP + shift-based
bit extraction for callee-save preservation). Two
parallel application waves rolled into one brief, like
brief 106's C-26 wave 2 + P-9 early-return pattern.

**Part 1 — C-29 application wave 1:**

Brief 111 codified `if (p == 0)` → `if (!p)` as the
recipe for the P-10 over-predication wall. The change
is a one-character source-form difference; mwcc 2.0
lowers them to different control flows (predicated vs
early-return).

**Scope:** wall fires when the unpredicated tail is ≥ 3
instructions. Short tails (1-2 insns) keep predicating
even with `!p`.

**Pool (per brief 109's cross-corpus survey + brief
111's idiom matrix):** ~36 P-10 strict-signature
candidates total. With the ≥3-insn-tail scope filter,
estimate **20-25 recoverable**.

**Selection (wave 1, 10-15 candidates):**

- Enumerate the 36-candidate strict P-10 pool. Brief 109
  named some: examples from brief 103's earlier sweep
  + brief 111's worked example (`func_02037b34`).
- **Filter to ≥3-insn unpredicated tails.** Asm shape:
  `mvneq rN, #0` followed by ≥ 3 unpredicated insns
  (ldr / lsl / lsr / etc.) before the `popXX` / `bxXX`.
- Skip those with ≤ 2-insn tails (won't recover).
- Pick 10-15 from the 0x20-0x40 size band.

**Per-candidate workflow:**

1. Write source using `if (!p)` (or inverted form `if
   (p != 0) { ... } return -1;`).
2. Default mwcc 2.0/sp1p5 routing; no `.legacy.c`
   needed.
3. Add delinks.txt entry.
4. `ninja rom` + verify byte-identical.

**Try natural form FIRST per the 8-NEGATIVE-finding
rule.** Some candidates might match with `if (p == 0)`
already if their asm happens to early-return for
unrelated reasons.

**Part 2 — C-30 application wave 1:**

Brief 111 codified the C-30 recipe (extends C-27 with
shift-based bit extraction) on `func_020071c4`. Brief
108 had 5 callee-save dropped candidates total; brief
111 took 1. The remaining 4 are brief 112's wave:

| Candidate | Brief 108 funnel notes |
|---|---|
| `func_02024024` | callee-save + loop scheduling |
| `func_02024574` | callee-save + loop scheduling |
| `func_0202a1cc` | callee-save preservation |
| `func_0202a27c` | callee-save + loop scheduling |

**Per-candidate workflow (per brief 111's
`func_020071c4` worked example):**

1. Identify the duplicate-pool target address.
2. Write source with dual-extern declarations + shift-
   based bit extraction (`(v << N) >> M` pattern).
3. Add `data_X_alias` entry to `symbols.txt`.
4. Add delinks.txt entry.
5. `ninja rom` + verify.

**Note on loop scheduling:** 3 of 4 candidates have
loop scheduling divergence on top of callee-save. C-30
may or may not be sufficient; if not, document the
specific scheduling shape for future cloud research.

**Self-extend clause:**

Yield ≥ 40% + bytes ≥ 250 triggers wave 2. C-29 has
~25 remaining candidates after wave 1 (good pool
depth); C-30 only has 4 total (drained after wave 1).
Wave 2 would primarily be more C-29 candidates.

**Non-scope:**

- ❌ Permuter sweeps. P-class candidates skip-listed.
- ❌ C-27 wave 2 retry — separate future brief (114+).
- ❌ T-4 application — separate future brief (115+).
- ❌ Cross-region apply for new matches (brief 114+
  candidate).
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- **Combined: ≥ 10 EUR matches, ≥ 250 bytes.**
- All 3 regions stay at 24/27 baseline.
- Per-wave PR with funnel + per-candidate table
  flagging C-29 vs C-30 + natural-form-first attempt
  outcomes.

**Branch:** `decomper/c29-c30-application-wave`

**After this brief lands:**

1. **Strong combined yield (≥ 60%):** wave 2 self-
   extends on C-29. ~15-25 candidates remain in C-29
   pool after wave 1.
2. **Mid combined yield (40-60%):** 1 follow-up wave.
   Brain queues brief 114 = either C-29 wave 2 OR
   pivot to C-28 application / T-4 / data-tier per
   the backlog.
3. **Weak combined yield (< 40%):** chain closes.
   Investigate per-candidate why; possible new wall
   datapoints to feed cloud follow-up.
