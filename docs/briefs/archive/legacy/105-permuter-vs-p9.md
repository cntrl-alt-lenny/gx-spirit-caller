### cloud/permuter-vs-p9

**Goal:** Run permuter (brief 096 wrapper) against
representative P-9 candidates. Brief 103 (PR #501)
classified P-9 (mvnNE-write peephole gap) as permanent
for the source-form pipeline — 6 source variants × 15
SPs (90 compiles) all missed. Permuter is the natural
next-attempt path per brief 098's P-8 → C-25 precedent.
If ≥ 1 candidate recovers, P-9 promotes to C-N via
brief 100-style codification.

**Context — P-9 mechanism (per brief 103 PR #501):**

mwcc 2.0 lowers `cond ? -1 : 0` as `mov + rsb` instead
of direct conditional `mvnNE rN, #0`. The peephole
appears absent across all 15 SPs in the toolchain.
Recipe candidates tried in brief 103 (natural ternary,
explicit mask local, inline `& -1`, `~0` instead of
`-1`, if/else chain, split-statement form) — none emit
`mvnNE rN, #0`.

**Why permuter:** the wall is in mwcc 2.0's IR-level
lowering decision. Source-form coercion didn't crack
it. **Permuter explores transformation space beyond
what source-form authors can express** — this is exactly
brief 098's P-8 / W-N pattern: source-form-coercible
recipes that permuter discovers but human authors
wouldn't reach.

**Candidate pool:**

Brief 103 identified 36 strict P-9 signature candidates
in cross-corpus survey. Named examples:

- `func_020534b4` — smallest exemplar, 9-insn skeleton
  (brief 103 worked example)
- `func_02037b34`
- `func_02033488`
- `func_02054c0c`
- `func_02000d4c`
- `func_02022540`

**Wave selection:** 5-8 candidates from the 0x20-0x40
size band. Smaller iterates faster; brief 098 throughput
was ~200-230 iter / 60s / thread.

**Method:**

1. **Stage source baselines.** Decomper hasn't written
   source for these — cloud writes the baseline `.c`
   for each candidate (single ternary or if/else form,
   whatever closest-to-orig shape; per the brief 103
   sweep matrix). This is not the brief 098 source
   pre-staging gap — permuter needs a starting point,
   not a finished match.

2. **Per-candidate workflow:**

   ```bash
   python tools/permute.py <func_name> --run --max-seconds 300 --threads 4
   ```

   5 min × 4 threads ≈ 1200 thread-iterations per
   candidate. Brief 098's calibration suggests this is
   adequate for 0x20-0x40 size band.

3. **Score-tracking:**
   - Baseline score = objdiff bytes-diff against orig.
     P-9 candidates start at score 10-30 (per brief 103
     sweep matrix).
   - Recovery = score 0.
   - Plateau analysis: if score plateaus at a non-zero
     value, document the residual divergence (which
     insns / which regs) — if it consistently shows
     `mov + rsb` vs `mvnNE`, the wall is confirmed at
     the allocator level.

4. **Per-recovery:**
   - Commit the recovered `.c` source as a new TU.
   - Add delinks.txt entry.
   - Verify EUR `ninja rom` + `dsd check modules`
     24/27.
   - Note the permuter cycle-cost (iterations to
     recover) for future calibration.

5. **Document outcomes:**
   - **≥ 1 recovery** → P-9 promotes to C-N candidate.
     Next brief (cloud) codifies the recipe per brief
     100 / 098 pattern.
   - **0 recoveries** → P-9 confirmed permanent for
     both source-form AND permuter paths. Brain's
     selection rule treats P-9 asm signature as a hard
     skip for future single-region waves; `asm void` +
     `nofralloc` recipe (C-12 / C-16 style) remains the
     last-resort path.

**Non-scope:**

- ❌ New permuter features (brief 096 wrapper as-is).
- ❌ Walls research beyond P-9.
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- ≥ 5 P-9 candidates attempted with source baselines.
- Per-candidate score plateau + cycle-cost documented.
- All 3 regions stay at 24/27 baseline (for any
  byte-identical recoveries committed).
- New `src/main/func_*.c` files for recoveries.
- If 0 recoveries, the failure mode is documented
  (which insn-positions diverge, suggesting the wall is
  at mwcc's IR lowering vs. allocator).

**Branch:** `cloud/permuter-vs-p9`

**Priority:** MEDIUM. Decomper brief 104 (C-24 w3 +
C-26 application) is the higher-leverage immediate move.
Brief 105 runs in parallel; its outcome feeds brief
106+ scoping (whether to codify P-9 → C-N).

**After this brief lands:**

1. **≥ 1 recovery:** Brain queues brief 106 (cloud) as
   P-9 → C-N codification per brief 100's pattern. The
   broader 36-candidate strict-signature pool absorbs
   the new recipe in a future single-region wave.
2. **0 recoveries:** P-9 stays permanent (both paths
   exhausted). Brain's skip-rule treats the P-9 signature
   as final. Selection rule pre-emptively skips the 36
   candidates in any future single-region wave.
3. **Methodology refinement:** the P-8 → C-25 promotion
   (brief 098) and P-9 → ? outcome are 2 datapoints for
   "how often does permuter rescue a P-class
   classification?" Useful calibration for future P-N
   filings.
