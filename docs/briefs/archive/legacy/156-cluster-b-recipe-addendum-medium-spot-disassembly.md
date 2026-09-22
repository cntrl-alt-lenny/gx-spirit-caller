### cloud/cluster-b-recipe-addendum-medium-spot-disassembly

**Goal:** Two small follow-ups to recent merges.

1. **Addendum to `docs/research/cluster-b-size-1-2-recipe.md`**
   noting that the bundle recipe also drains cluster B value=0
   size=4 candidates (decomper's brief 155 finding). Same root
   cause; broader application.
2. **Spot-disassemble 5-10 MEDIUM-confidence candidates** from
   brief 154's catalog of 606 `ov004 .rodata` symbols. Report
   per-candidate: real ARM function or not? Recalibrate the
   structural-fingerprint heuristic's hit rate.

**Context — what brief 155 + 154 surfaced:**

Brief 155 (PR #584) pivoted from the empty main size-1/2 pool
to cluster B's 21 W6-rejected (size=4 value=0) main candidates
and shipped 16 bundles (18 of 21 candidates drained, 100%
yield, 392 bytes). The PR funnel called out:

> Brief 152's `unsigned int[N]` bundle recipe applies beyond
> size-1/2. Root cause is the same in both cases — mwcc emits
> TUs whose `.data` section contains only padding bytes (zero
> pad between strings/data, or sub-4-byte size scalars) in a
> way that breaks `.data` layout. The bundle recipe forces
> non-zero content into the TU's `.data` section, which both:
> (1) prevents mwcc emitting the TU to `.bss`, (2) makes the
> section a 4-byte multiple, sidestepping `ALIGNALL(2)` pad-
> cascade for sub-4-byte sections.

Brief 154 (PR #581) was reframed as survey-only after the
HIGH-confidence worked example (`0x021e2efc`) broke EUR SHA1.
The brief now lists 606 MEDIUM candidates that share the same
structural fingerprint (`load` reloc from in-`.rodata`) but
need byte-confirmation before any could promote to HIGH. The
calibration question: of N spot-disassembled MEDIUM
candidates, how many show coherent ARM-function bytes? If
most show "looks like a prologue but is actually data", the
MEDIUM cohort is mostly false positives and reclassification
isn't a viable veneer-suppression lever.

**Brief 156 deliverables:**

### Part 1 — Addendum to `docs/research/cluster-b-size-1-2-recipe.md`

One-paragraph section near the bottom (or appended as a
"Generalisation" subsection) explaining:

- The bundle recipe also drains cluster B value=0 size=4
  candidates (per brief 155 PR #584).
- Same root cause: mwcc emits zero-padded `.data` sections
  to `.bss` rather than `.data`, breaking layout.
- Bundling with a non-zero neighbour (or the placeholder's
  neighbour pattern brief 155 uses) forces `.data` emission.
- Cross-reference brief 155 for the value=0 application.

No code changes — pure docs.

### Part 2 — Spot-disassemble 5-10 MEDIUM candidates

Pick **5-10 MEDIUM-confidence ov004 `.rodata` candidates**
from `docs/research/ov004-rodata-misclassification-survey.md`
(prefer ones with distinctive byte patterns, e.g., starting
with `STMFD` `e92d` prefix, but include 2-3 that look
ambiguous as a control). For each:

1. **Disassemble the first 16-32 bytes** at the candidate's
   address. Use `dsd disasm` or `arm-none-eabi-objdump -D` on
   the binary chunk extracted from `arm9_ov004.bin`.
2. **Inspect for ARM function coherence**: prologue (`STMFD
   sp!, {…}`), reasonable body instructions, epilogue (`LDMFD
   sp!, {…, pc}` or `BX lr`). Compare against canonical ARM
   function shapes brief 057-112 codified.
3. **Report PASS / AMBIGUOUS / FAIL** per candidate in a new
   section of the survey doc (or sibling
   `docs/research/ov004-rodata-misclassification-spot-disasm.md`).

**Crucially: do NOT reclassify any symbols in this PR.** The
worked-example falsification in brief 154 PR #581 already
showed that byte-pattern match alone isn't sufficient.
Reclassification belongs in a separate decomper-led brief
(possibly brief 158+) after this brief recalibrates the
heuristic.

If 5-10 candidates' PASS rate is:

- **≥ 70% PASS** → cohort is likely viable; brain scopes a
  cautious reclassification brief that disassembles
  whole-function context + uses bisection to verify.
- **30-70% PASS** → mixed; recipe needs whole-region
  disassembly or alternative methodology.
- **< 30% PASS** → cohort is mostly false positives;
  reclassification isn't the n<9 lever; pivot to the
  reverse-lookup tool for ov002 cross-overlay pointer
  targets (cloud brief 150 funnel mentioned this).

**Required smoke test (cloud runs pre-PR, brain re-runs
pre-merge):**

- 3-region `ninja sha1` PASS preserved (trivial — docs-only
  + report).
- All existing tests still green.
- Markdownlint clean on the addendum + spot-disasm note.

**Non-scope:**

- ❌ Reclassifying ANY symbols.
- ❌ Modifying `tools/` or `src/`.
- ❌ Bulk-disassembling the 22.5 KB mega `.rodata` block
  (brief 154 non-scope — separate brief).
- ❌ Building the reverse-lookup tool (brief 150 funnel hand-
  off — separate brief).
- ❌ AGENTS.md / state.md / decomper-owned paths.

**Success:**

- Recipe addendum lands in `cluster-b-size-1-2-recipe.md`.
- 5-10 MEDIUM candidates spot-disassembled with PASS/AMBIGUOUS/
  FAIL report.
- Heuristic recalibration finding documented + sized for
  brain's next-brief decision.
- 3-region SHA1 PASS preserved.
- Markdownlint clean.

**Branch:** `cloud/cluster-b-recipe-addendum-medium-spot-disassembly`

**Priority:** MEDIUM. Both deliverables are small research
follow-ups; combined into one PR to keep the cycle tight.

**After this brief lands:**

1. Brain reads the spot-disasm report; decides whether to:
   - Scope a cautious reclassification brief (if hit rate
     ≥ 70%), OR
   - Pivot to reverse-lookup tool for ov002 cross-overlay
     pointer targets (if hit rate < 30% — that's the cleaner
     path to identifying actual veneer-suppressor slots), OR
   - Defer ov004 .rodata work and continue cluster D-3 / 30 KB
     mega-array / cross-region applies.
2. Recipe addendum makes the bundle recipe's full generality
   discoverable from a single research note.
