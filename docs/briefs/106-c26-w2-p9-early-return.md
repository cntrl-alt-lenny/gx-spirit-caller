### decomper/c26-w2-p9-early-return

**Goal:** Two-part wave continuing two newly-opened
recipe pools — C-26 strict-sig wave 2 (broader pool
from brief 104) + P-9 early-return sub-pool from brief
105's scope refinement.

**Part 1 — C-26 strict-signature wave 2:**

Brief 104 wave 1 landed 4 ports (all `.legacy.c`, all
confirmed via helper-first-instruction inspection rule).
~121 candidates remain in the 125-candidate broader
strict-sig pool. Recipe is production-ready per brief
100's documentation + brief 104's wave 1 validation.

**Selection (8-12 candidates):**

- Apply brief 100's helper-body inspection rule per
  candidate: if helper's first non-prologue instruction
  writes r0 (`ldr r0, [pc, #N]`, `mov r0, #N`, etc.),
  C-26 applies via `.legacy.c` routing + no-arg helper
  signature in C source.
- Try natural form FIRST per the now-operational rule
  (5 NEGATIVE findings in a row says ~30% of
  candidates won't need any routing change).

**Part 2 — P-9 early-return sub-pool application:**

Brief 105's scope refinement partitioned the 36-
candidate strict P-9 pool:

- **~12 early-return-form candidates** (`if (cond)
  return -1; ...` shape) — natural source recoverable
  per brief 105's `func_02033488` recovery.
- **~24 mask-form candidates** (`cond ? -1 : 0` shape)
  — true P-9 permanent for both source-form AND
  permuter; await `asm void` recipe brief.

**Selection (6-10 candidates from the early-return
sub-pool):**

- Identify via asm pattern: `mvnEQ rN, #0` followed by
  early-return epilogue (`popEQ` or `bxEQ lr`). NOT
  the cascading `mvnNE; andNE; movEQ` shape.
- Apply natural source: `if (cond) return -1;` followed
  by remaining function body. Default `.c` (mwcc 2.0/
  sp1p5).
- Brief 105 documented this works at iteration 1 in the
  permuter (i.e. baseline = byte-identical); decomper
  should attempt as straightforward source-form
  application.

**Method:**

Both parts use the standard per-port workflow:

1. Write source.
2. Add delinks.txt entry.
3. `ninja rom` + `ninja objdiff`.
4. Verify byte-identical.

Track per-port in PR funnel: which part (C-26 wave 2
vs P-9 early-return), which recipe variant, natural-
form-first attempt outcome.

**Self-extend clause:** Combined yield ≥40% AND bytes
≥250 triggers wave 3. C-26 has ~110 remaining candidates
after wave 2, so further self-extend is likely if rates
hold.

**Non-scope:**

- ❌ P-9 mask-form candidates (await asm-void recipe
  brief).
- ❌ Permuter sweeps.
- ❌ Cross-region apply for new matches (await
  accumulation; brief 108+ candidate).
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- Part 1 (C-26 wave 2): ≥ 5 byte-identical ports.
- Part 2 (P-9 early-return): ≥ 5 byte-identical ports.
- **Combined: ≥ 10 EUR matches, ≥ 250 bytes.**
- All 3 regions stay at 24/27 baseline.
- Per-wave PR with funnel + per-candidate table flagging
  C-26 vs P-9 + natural-form attempts.

**Branch:** `decomper/c26-w2-p9-early-return`

**After this brief lands:**

1. **Strong combined yield (≥ 60%):** wave 3 self-
   extends. C-26 pool has ~100+ candidates remaining
   after wave 2; could absorb 1-2 more waves before
   pool drain.
2. **Mid combined yield (40-60%):** wave 2 + 1 follow-
   up wave maximum. Brain queues brief 108 = either
   another C-26 wave OR cross-region apply for
   accumulated brief 101-106 single-region matches.
3. **Weak combined yield (< 40%):** chain closes. Brain
   pivots to data-tier scoping OR permuter source pre-
   staging brief.
