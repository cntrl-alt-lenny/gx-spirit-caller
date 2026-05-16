### cloud/poolword-crossmodule-bl-research

**Goal:** Close the brief 097 medium-tier residue
classification by covering the final two patterns —
**pool-word count mismatch** (~3 candidates) +
**cross-module BL** (~3 candidates). Roll both into one
brief since each pattern's population is small (~3
candidates each). Brief 084 / 088 / 099 / 100 / 103 /
105-style codegen sweeps on smallest exemplars.

**Context — what remains from brief 097's classification:**

Brief 097 (decomper hand-back) identified 31 medium-
tier residue candidates with these patterns:

| Pattern | Closed by | Outcome |
|---|---|---|
| Indirect call (~12) | brief 099 → C-24 | recipe shipped (33 ports via briefs 101+102+104) |
| Critical-section (~8) | brief 100 → C-26 | recipe shipped (4 ports via brief 104) |
| Predicated cascade (~6) | brief 103 → P-9 | permanent + scope refinement via brief 105 |
| **Pool-word count (~3)** | **this brief** | TBD |
| **Cross-module BL (~3)** | **this brief** | TBD |

After this brief, brief 097's residue is fully
classified. The natural-form-first rule has already
showed ~30% of any pattern's candidates are over-
classified; brief 107 should expect the same baseline.

**Part 1 — Pool-word count walls research:**

Brief 097 example: `func_02023fec` (0x38). orig emits
1 pool word; mwcc default emits 2 pool words (callee-
save register reservation pattern). The wall is in
mwcc's pool placement / dedup decision.

Pattern signature:

- `ldr rN, [pc, #X]` followed by `ldr rM, [pc, #Y]`
  where X and Y point to the same address constant.
- mwcc 2.0 emits 2 separate pool entries; orig has 1
  shared.
- Brief 099's C-24 dedup recipe (single-global
  identifier) might apply — but C-24 was specifically
  for indirect call + pool-dedup; pool-word count
  without the indirect call might need a different
  shape.

**Sweep:**

- 4-5 source variants on smallest exemplar
  (`func_02023fec` is 0x38):
  - Single global pointer referenced twice (C-24 style)
  - Two locals pointing to the same global
  - `static const T *p` declared at file scope
  - `volatile T *p` qualifier
  - Inline asm escape (`asm volatile("ldr %0, =0x..."
    : "=r"(p));`)
- 15 SPs × ~5 variants ≈ 75 compiles.
- Watch for natural-form NEGATIVE finding.

**Part 2 — Cross-module BL walls research:**

Brief 097 example: ~3 candidates reference `0x021b5500`
from ov011 but the target address isn't in any
symbols.txt. Pattern signature:

- `bl 0x021b____` to an address not in the current
  module's symbols.txt.
- Likely a cross-module call to an overlay function or
  unmatched callee.

This is partly a SYMBOLS issue (the callee needs to be
identified + renamed) and partly a CODEGEN issue (once
named, the call should byte-match without recipe
changes). Brief 107 should:

1. Identify the actual callee at each address via cross-
   module reference scan (overlay tables in `dsd` +
   ov*/symbols.txt).
2. Determine whether it's:
   - **Pure naming issue**: name the callee → match
     trivially.
   - **Codegen wall**: even with named callee, BL
     emits different shape.

If pure naming, the recipe is "rename the callee, no
codegen change." If codegen wall, classify accordingly.

**Method:**

Per brief 084 / 088 / 099 / 100 / 103 pattern:

1. Pick smallest exemplar from each part.
2. Run codegen sweep + classify.
3. Cross-corpus scan for additional candidates
   matching each pattern's signature.
4. Document in codegen-walls.md as C-N or P-N entries
   per outcome.

**Non-scope:**

- ❌ Applying any recipe — research only. Decomper
  applies in a future single-region wave.
- ❌ Brief 097's already-classified patterns.
- ❌ Permuter sweeps.
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- ≥ 1 new codegen-walls.md entry per pattern (2 total
  if both surface a recipe; could be C-N or P-N).
- Codegen sweep matrices attached.
- Brief 097 residue classification complete (intro
  paragraph note in codegen-walls.md).
- Markdown lint clean.
- Research index regen current.

**Branch:** `cloud/poolword-crossmodule-bl-research`

**Priority:** MEDIUM. Decomper brief 106 (C-26 wave 2
+ P-9 early-return) is the higher-leverage immediate
move. Brief 107 runs in parallel and CLOSES the brief
097 residue classification phase.

**After this brief lands:**

1. **Both recipes found** → brief 108 (decomper) wave
   applies both to the small candidate pools.
2. **P-N classifications** → brain's skip-list gains
   the asm signatures.
3. **Pure naming issue for cross-module BL** → not a
   codegen wall; named-symbol promotion brief queued
   instead.
4. **Brief 097 residue closed** → walls-research
   methodology pipeline pivots to either:
   - New residue surfacing from brief 106's hand-back
     (if any).
   - Data-tier scoping (the biggest unrealized lever).
   - W-stack-split codegen sweep (awaiting 3rd
     datapoint).
