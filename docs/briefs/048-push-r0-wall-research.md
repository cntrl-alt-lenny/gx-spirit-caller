### cloud/push-r0-wall-research

**Goal:** Research the **push-r0-spill idiom** wall surfaced in
brief 046 wave 7 (PR #347). Determine whether it's coercible
(C-N), a new compiler tier (T-N), or permanent (P-N). Update
`codegen-walls.md` with the findings.

**Context:**

Brief 046 wave 7 attempted `func_02093294` and `func_02092f04`
(both `push {r0, lr}` arg-preserving thunks). Routed via sp2p3
(`.legacy.c`) because the epilogue is Style A
(`pop {r0, lr}; bx lr`), but mwcc 1.2/sp2p3 emitted
`push {r4, lr}; mov r4, r0; ...` — +8 bytes over target. Decomper
flagged for cloud follow-up.

The push-r0 form preserves the first arg without a separate
`mov`. Used in:

- Tail-call wrappers that spill arg before calling helpers
  that clobber r0 (the "push then call then pop" pattern).
- Inline asm in the original source (less likely — the project
  is mostly C).

Brief 044's 3-tier discriminator covers Style A vs Style B
epilogues but not push-r0. This may be a 4th compiler tier or
a coercion within an existing tier.

**Method (suggested, in priority order):**

1. **C-variation sweep.** Try ~10 C shapes against
   `func_02093294` with mwcc 1.2/sp2p3:
   - `void f(int x) { something(); }` (just call helper)
   - `int f(int x) { something(); return x; }` (preserve x for caller)
   - `void f(int x) { void *saved = ...; something(); }` (force spill)
   - `static volatile int saved` patterns
   - Inline-asm variations (`__asm` blocks if mwcc supports them)
   - Function-pointer patterns
   - All same-prologue with sp1p5 + sp3 to compare

   If any flips to byte-identical, classify as **C-N coercible**.

2. **mwcc-version sweep** (across the existing 15 SPs already
   downloaded).
   - sp1p5 / sp2p3 / sp3 are known. Try sp1, sp1p1, sp1p2, sp1p3,
     sp1p4 + 1.2/base, 1.2/sp2, 1.2/sp4 against the same target.
   - If any SP emits the push-r0 form, classify as **T-N**
     (potentially worth a 4th routing tier if ≥10 candidates exist).

3. **Inline-asm hypothesis.** If neither C nor compiler-version
   coerces, the original source likely used inline asm. Check
   whether the `.s` file route from brief 013 / pokediamond would
   land it. If yes, classify as **E-N edge case** (asm-only).

**Deliverable:** Update `docs/research/codegen-walls.md`:

- Add a **W-E** entry (or claim the next available W-letter) with
  the wall description, target asm, mwcc 2.0/sp1p5 + sp2p3
  diverged asm.
- Classification (C-N / T-N / E-N / P-N) with verdict.
- For T-N: list the SP that emits it. If ≥10 candidates exist
  (sweep `next_targets.py` + cluster output for similar push-r0
  signatures), add a "future tier" subsection like brief 044's.
- Optional: a "How to coerce" subsection with the specific C
  variation if C-N.

**Non-scope:**

- ❌ Implementing a 4th routing tier. Recommend in the research
  note if T-N — brain queues an implementation brief if needed
  (same shape as brief 045).
- ❌ src/, libs/, AGENTS.md, state.md edits.
- ❌ Touching brief 046's other parked walls (P-7 pool dedup,
  sp3 reg-alloc, literal-pool fold). Each gets its own brief if
  worth pursuing.

**Success:**

- W-E (or next letter) entry added to codegen-walls.md.
- Verdict + evidence (asm comparison or C variation).
- Markdown lint clean.

**Branch:** `cloud/push-r0-wall-research`

**Priority:** Medium. Decomper isn't blocked on this; brief 047
explicitly skips push-r0 candidates. Worth picking up if cloud
has bandwidth.

**After this brief lands:**

1. If C-N → brain queues a small decomper brief re-attempting the
   push-r0 thunks with the documented coercion.
2. If T-N + ≥10 candidates → brain queues a 4th routing-tier
   implementation brief (cloud).
3. If E-N → mark the push-r0 candidates as `.s`-only territory,
   defer.
4. If P-N → state.md notes them as permanently deferred.
