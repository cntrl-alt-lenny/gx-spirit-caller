### cloud/ov004-thunk-section-fix

**Goal:** **🔑 26/27 baseline unlock.** Fix the Cat 4
toolchain issue brief 129 identified: mwldarm emits
86 spurious thumb→arm veneers in `.rodata` because it
doesn't model overlay swapping. The 1,024-byte veneer
pool cascades ~165 KB of byte-diff downstream. When
fixed, ov004 flips OK and ARM9 main auto-flips on its
16 cascade bytes → **27/27 baseline across all 3
regions** (or 26/27 if main has unanticipated residue).

**Context — what brief 129 established:**

- mwldarm sees calls to ov002 functions in ov004 code
  and treats them as cross-section calls requiring
  veneers (since ov002 is in a "different" section).
- At runtime ov002 + ov004 are mutually-exclusive
  overlays sharing the same VA range; mwldarm has no
  way to know this.
- 86 veneers × 12 bytes = 1,024 bytes appended to ov004's
  `.rodata`.
- Veneer pool shifts the section-end by 1,024 → cascades
  to `.data` (+0x400) and downstream sections.

**Brief 131 recommended approach (Option 3 from brief
129): LCF `.thunk` section.**

Modify the dsd-generated linker config (LCF) for ov004
to include a `.thunk` section that absorbs mwldarm's
veneers without displacing `.data`. The veneers still
get emitted (mwldarm's behavior unchanged), but they
land in a section that:

1. Doesn't appear in the final ROM image (or appears
   in a discardable slot).
2. Doesn't shift `.data` or downstream sections.

Specific approaches to investigate:

- **(3a) `/DISCARD/` section** — direct all veneers to
  /DISCARD/. Risk: mwldarm may complain about unused
  output sections; some toolchains do, some don't.
- **(3b) `.thunk` at end of `.rodata`** — explicit
  section that captures veneers AFTER the section-end
  pin, so `.rodata` end VA is fixed regardless of
  veneer count.
- **(3c) Modify dsd's LCF gen** — make dsd emit a
  `.thunk` placeholder that mwldarm targets for
  veneers. More invasive; requires dsd changes.

**Fallback options (if 3 doesn't work):**

- **Option 1: mwldarm flag tweak.** Investigate
  `-veneer_section` or similar mwldarm flags. May not
  exist for ds-era version.
- **Option 2: Per-overlay symbol filtering.** Strip
  ov002 symbols from ov004's link input so mwldarm
  doesn't see them. Risk: dsd's analysis still
  generates the BL instructions; runtime calls would
  break (but they don't anyway because of overlay
  swap — confirm via emulator test).
- **Option 4: dsd init re-run with overlay-aware
  scoping.** Largest scope; flagged as last resort
  in brief 129.

**Method:**

1. **Read brief 129's analysis** + the mwldarm
   documentation (if any) on section directives.
2. **Read dsd's LCF generation code** — understand
   how the current ov004 LCF is produced + where
   to inject the `.thunk` section.
3. **Try Option 3a first** (/DISCARD/, simplest).
   Modify dsd's LCF or hand-edit the generated LCF
   to redirect veneers.
4. **`ninja rom`** + `dsd check modules`. Goal: ov004
   flips FAILED → OK.
5. **If 3a works:** check main too — should flip on
   the 16 cascade bytes. **3-region baseline 25/27 →
   27/27** (best case) **or 26/27** (if main has Cat
   2/3 residue brief 127 missed).
6. **If 3a fails:** try 3b (explicit `.thunk` section
   at `.rodata` end). Then 3c (dsd LCF gen). Then
   Options 1/2/4.

**Per-option success criteria:**

- ov004's `.rodata` byte-diff drops to 0 (or close).
- ov004 `dsd check modules` reports OK.
- Main auto-flips (or shrinks to its un-cascaded
  residue if any).
- No regressions in other modules (ov0/1/2/3/5+ stay
  OK).

**W7 documentation:**

Once a fix lands, document the workflow wall in
`codegen-walls.md` (or workflow-walls section) as
**W7: mwldarm overlay-swap blindness** with:

- Mechanism: mwldarm emits veneers for cross-section
  calls to mutually-exclusive overlays.
- Diagnosis: 12-byte veneer pattern in `.rodata`
  (`7847 c046 04f01fe5 <target>`).
- Mitigation: LCF `.thunk` section absorbs veneers
  without displacing downstream sections.
- Cross-reference: brief 129 scoping; brief 131 fix.

**Non-scope:**

- ❌ Fixing main's Cat 2/3 residue separately —
  it's expected to auto-resolve via cascade.
- ❌ Recovering function-level matches in ov004
  (309/310 still placeholder per brief 129;
  orthogonal).
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- **ov004 module checksum: FAILED → OK** across all
  3 regions.
- **3-region baseline ≥ 26/27** (main may or may
  not auto-flip in addition).
- W7 workflow wall documented.
- LCF / dsd / mwldarm change documented in PR body
  + research note.
- No regressions in other modules.

**Branch:** `cloud/ov004-thunk-section-fix`

**Priority:** HIGH. **🔑 26/27 baseline unlock.** Same
priority tier as decomper brief 130 (parallel-track).

**After this brief lands:**

1. **26/27 (or 27/27) baseline achieved.** Visible-
   progress milestone — first multi-module-baseline
   improvement since brief 116's 25/27.
2. **Brief 132 candidate** — Phase 2 OV004 residue
   cleanup if Cat 4 fix doesn't fully close the gap.
3. **Brief 133+ data-tier waves** can now include
   ov004 candidates (cluster A `.bss` was already
   claimed in brief 118, but cluster C/D candidates
   were skipped due to baseline cascade — now
   accessible).
4. **If 27/27**: only OV004's function-level
   placeholders remain to push to SHA1-match.
   Long road but the toolchain is now clean.
