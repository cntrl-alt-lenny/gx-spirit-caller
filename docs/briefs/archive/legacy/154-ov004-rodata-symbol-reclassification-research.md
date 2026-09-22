### cloud/ov004-rodata-symbol-reclassification-research

**Goal:** Survey ov004's misclassified-as-`data` `.rodata`
symbols that currently appear in `config/eur/arm9/overlays/ov004/
symbols.txt`, propose reclassifications to `func` for the
fraction that are actually ARM code, and ship 1-2 worked
examples with 3-region SHA1 PASS. Brief 151's "BONUS NOT MET"
investigation (PR #578) identified this as the gating
dependency for further veneer-count reduction below n=9.

**Context:**

Brief 151 (PR #578) shipped 28 ov004 `.rodata` source-level
claims (40% over target) but **could not drop ov004's veneer
count `n` below 9** — the structural floor. Investigation
showed:

- The 9 remaining veneer references can't be eliminated by
  source-level `.rodata` claims with the current symbol
  classification.
- One investigation path attempted Pattern 3 at `0x021e2efc`
  (a worklist "rodata" candidate); the bytes turned out to be
  ARM code (`30 40 2d e9 04 d0 4d e2 …` = function prologue),
  not real `.rodata` data. Claiming it as `.rodata` shifted
  link layout and broke SHA1.
- Decomper's recommendation (PR #578 "Brief 153+ recommendation"
  section): **reclassify ov004's misclassified-as-`data`
  `.rodata` symbols to `func` in `symbols.txt`**, OR
  disassemble the 22.5 KB mega `.rodata` block (much larger
  undertaking, defer).

This brief takes the first option — symbol reclassification
research as a focused cloud task.

**Scope:**

Three deliverables, ordered by priority:

1. **Reclassification candidate survey.** Walk
   `config/eur/arm9/overlays/ov004/symbols.txt` looking for
   symbols currently classified as `data` whose byte content
   in the original ROM (`extract/eur/arm9/overlays/ov004.bin`)
   reads as ARM code. Heuristics:
   - First 4 bytes match common ARM prologue patterns
     (`stmfd sp!, {…}` encodings, immediate-prefix `mov pc, lr`,
     etc.).
   - Symbol at 4-aligned address (ARM functions are 4-aligned;
     `.rodata` data can be 1- or 2-aligned).
   - Symbol size is a small multiple of 4 (typical for ARM
     functions; small variable-size `.rodata` chunks are
     less aligned).
   Output as `docs/research/ov004-rodata-misclassification-
   survey.md` with a candidate table:
   `vaddr | size | current_class | proposed_class | confidence
   | ARM prologue match`.

2. **Per-candidate confidence + risk note.** For each candidate,
   flag whether reclassification is safe:
   - **HIGH confidence** — multiple ARM-prologue matches +
     correct alignment + size pattern.
   - **MEDIUM** — partial match (one or two indicators).
   - **LOW / DEFER** — ambiguous; needs disassembly to verify.

3. **Worked example ship — 1-2 HIGH-confidence reclassifications.**
   Pick the 1-2 most clearly-ARM-code candidates, change their
   classification in `symbols.txt` from `data` to `func`, run
   the build, verify 3-region SHA1 PASS. If a reclassification
   causes a SHA1 break, the candidate was wrong (data-shaped
   bytes that incidentally pattern-match ARM); revert + lower
   confidence rating in the survey.

**Required smoke test (cloud runs pre-PR, brain re-runs
pre-merge):**

```
python tools/configure.py eur && ninja sha1   # must PASS
python tools/configure.py usa && ninja sha1   # must PASS
python tools/configure.py jpn && ninja sha1   # must PASS
```

3-region SHA1 PASS preserved across the reclassification +
worked-example changes. If brief 154's reclassifications cause
ANY region's SHA1 to drop, the PR does not merge.

**Bonus deliverable (optional, if survey is quick):**

If the survey is cheap (e.g. ≤ 1 day of research time), also
spot-check whether reclassifying 1-2 candidates **drops ov004's
veneer count below 9**. Brief 151 documented the brief 150
stderr note firing when n drops to 2 (genuine n<9 case), so a
correctly-reclassified function-as-`func` could trigger that
path. If observed, document the n=N delta in the PR body and
flag the unlocked candidate to brief 155+ (decomper).

**Non-scope:**

- ❌ Disassembling the 22.5 KB mega `.rodata` block at
  `0x02200f18`. Brief 151 already claimed that as a single
  Pattern 3 chunk; deeper disassembly is a separate, much
  larger undertaking.
- ❌ Reclassifying ALL candidates in one PR. Survey + 1-2
  worked examples; decomper's brief 155+ wave can apply the
  remaining HIGH-confidence reclassifications in bulk.
- ❌ Reverse-lookup tool for ov002 cross-overlay pointer
  targets (brief 150's deferred research item). Separate
  brief if/when ov004 reclassification proves the n<9 unlock
  works.
- ❌ Touching `src/`, `libs/`, `AGENTS.md`, `docs/state.md`.

**Success:**

- Survey landed at `docs/research/ov004-rodata-misclassification-
  survey.md` with candidate table + per-candidate confidence
  ratings.
- ≥ 1 HIGH-confidence reclassification shipped as a worked
  example with 3-region SHA1 PASS.
- All existing tests still green (1784+ baseline post-brief
  152).
- PR body documents whether the reclassification reduced
  ov004's veneer count, and if so to what value.

**Branch:** `cloud/ov004-rodata-symbol-reclassification-research`

**Priority:** MEDIUM. Brief 151's "bonus not met" is non-blocking
(SHA1 PASS holds at the current state; project goal is achieved
regardless). But it gates the next round of ov004 polish if
decomper wants to push n below 9 in a future wave.

**After this brief lands:**

1. Brain runs 3-region SHA1 PASS smoke test.
2. If survey produces a viable candidate list, brain scopes
   brief 155 (decomper) — apply remaining HIGH-confidence
   reclassifications + retry the ov004 sub-claims that
   brief 151 had to skip.
3. If reclassification doesn't unlock n<9 in practice (e.g.
   the misclassified symbols aren't on the suppression path),
   brain reconsiders whether to pursue the `.rodata` mega-block
   disassembly or pivot to a different cluster.
