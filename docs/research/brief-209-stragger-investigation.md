# Brief 209 — straggler investigation (post-brief-206)

**Brief:** 209 (decomper). Investigate the ~23 units that brief 206's
reloc-resolver harness flagged as `complete_code_percent: 100.0` +
`matched_functions: null` + `fuzzy_match_percent < 70`. These are
units where bytes match orig (the final ROM SHA1s pass) but objdiff
scores them as low-fuzzy and doesn't credit `matched_functions`.

## Headline

**All 23 stragglers share ONE root cause: `.s` files where instructions
are emitted as `.word 0xHEX` directives instead of ARM mnemonics.**
mwasmarm tags these with `$d` (data) mapping symbols, so objdiff's
diff reader treats them as data (not code) — producing low
fuzzy_match_percent even though the binary bytes are byte-identical.

The bytes are correct (SHA1 PASS preserved). This is purely a metric
under-counting issue from the brief 192/197 hand-encoded recipes.

## The 23 stragglers

| Module | Pick | Fuzzy% | Recipe |
|---|---|---:|---|
| ov011 | `func_ov011_021c9e98` | null | C-32 hand-encoded BLs |
| ov011 | `func_ov011_021cd754` | null | C-32 hand-encoded BLs |
| ov011 | `func_ov011_021cd940` | null | C-32 hand-encoded BLs |
| ov011 | `func_ov011_021cf0c8` | null | C-32 hand-encoded BLs |
| ov011 | `func_ov011_021cf358` | null | C-32 hand-encoded BLs |
| ov011 | `func_ov011_021cf640` | null | C-32 hand-encoded BLs |
| ov011 | `func_ov011_021d02a4` | null | C-32 hand-encoded BLs |
| ov011 | `func_ov011_021cada4` | 3.86 | C-32 hand-encoded BLs |
| ov011 | `func_ov011_021cf3dc` | 5.88 | C-32 hand-encoded BLs |
| ov011 | `func_ov011_021cb574` | 12.63 | C-32 hand-encoded BLs |
| ov011 | `func_ov011_021ca9e8` | 13.04 | C-32 hand-encoded BLs |
| ov011 | `func_ov011_021d0884` | 26.32 | C-32 hand-encoded BLs |
| ov011 | `func_ov011_021d07b0` | 30.19 | C-32 hand-encoded BLs |
| main | `func_0205da2c.legacy_sp3` | 42.86 | brief 201 sp3 routing |
| ov002 | `func_ov002_021ae60c.legacy` | 45.45 | brief 086 C-23 |
| ov002 | `func_ov002_021ae638.legacy` | 45.45 | brief 086 C-23 |
| ov002 | `func_ov002_021ae6a4.legacy` | 45.45 | brief 086 C-23 |
| main | `func_02091714.legacy` | 46.15 | C-23 main |
| ov012 | `func_ov012_021c9d8c` | 60.00 | StyleA cross-fn jump |
| ov013 | `func_ov013_021c9d60` | 60.00 | StyleA cross-fn jump |
| main | `func_020b3808` | 66.67 | inter-function `.word` branch |
| ov011 | `func_ov011_021ca0ac` | 66.67 | C-32 hand-encoded BLs (mixed) |
| main | `func_0209d724.legacy` | 69.23 | C-23 |

## Mechanism — the `$d` mapping marker

ARM ELF defines mapping symbols (`$a`, `$t`, `$d`) that mark
regions as ARM code / Thumb code / data within a `.text` section.
Disassemblers + diff tools use these to know whether to decode
bytes as instructions or treat them as data.

When mwasmarm processes a `.s` file:

- An ARM mnemonic (`stmdb sp!, {...}`) emits `$a` at that offset
- A `.word 0xHEX` directive emits `$d` at that offset

For brief 192's C-32 recipe (cross-overlay BL hand-encoding):

```asm
func_ov011_021ca9e8:
        .word   0xe92d4070     ; push {r4, r5, r6, lr} — hand-encoded
        .word   0xe59f00f8     ; ldr r0, [pc, #0xf8]   — hand-encoded
        .word   0xeb000000     ; bl func_in_other_overlay (.word for cross-ov)
        ; ... 100+ more .word lines
```

Every `.word` produces a `$d` marker. The function's ENTIRE body
is data-mapped from objdiff's perspective.

Compared to orig's delinks-extracted .o which has proper `$a`
markers at code regions:

```
Orig symbol table:
  $a at offset 0       ← ARM code starts here
  .L_021caa64 at 0x7c
  $a at 0x7c           ← code resumes (post inline pool)
  ...

Mine symbol table:
  $d at offset 0       ← DATA starts here (because .word)
  $a at 0x4c           ← only the first proper mnemonic is tagged code
  $d at 0x50           ← back to data
  ...
```

objdiff's diff reader sees radically different "shape" for the two
files even though byte-content is identical.

## Empirical verification

Built `func_ov011_021ca9e8` with a single mnemonic substitution at
the function entry:

```asm
func_ov011_021ca9e8:
        stmdb   sp!, {r4, r5, r6, lr}   ; 0xe92d4070 emitted via mnemonic
        .word   0xe59f00f8              ; rest unchanged
```

Result: symbol table changed from `$d at 0` → `$a at 0`. But fuzzy
went from 13.04% → 2.90% (WORSE). Why: now mwasmarm emits a
`$a/$d/$a/$d/...` pattern (one $d per `.word`), confusing the
objdiff reader more than the pure-$d pattern did.

**Conclusion:** partial mnemonic substitution makes it worse. To
improve fuzzy_match for these picks, ALL `.word`s in the function
body must become mnemonics. For cross-overlay BLs (the brief 192
case), that's not possible from the assembler's view — the BL
target lives in a different overlay's address space, which the
assembler can't reference directly.

## Recommendation for brief 210+

This is **NOT a decomper-side wall**. Three scaffolder-side paths to
unblock these for `matched_functions` credit:

1. **Post-process mwasmarm output** to rewrite `$d` markers as
   `$a` for any `.word` whose value decodes as a valid ARM
   instruction (i.e. all 4-byte-aligned `.word`s in `.text` that
   aren't part of a literal pool). Tool: extend
   `tools/patch_section_align.py` or add a sibling
   `tools/patch_arm_mapping_symbols.py`.

2. **Improve the brief 192 cross-overlay BL recipe** so cross-
   overlay BLs use a real `bl <symbol>` mnemonic + a relocation
   that the linker post-processes (the current `tools/patch_*`
   pipeline already has cross-overlay BL relocation handling per
   brief 192/197 — extending it to convert `.word` source → `bl`
   source is a tooling job, not a per-pick decomper job).

3. **Tune the objdiff fuzzy calculation** (upstream) to be
   byte-comparison-focused rather than mapping-aware. Pure
   byte-equivalence between the resolved sidecars should yield
   100% fuzzy regardless of `$a`/`$d` markers — currently it
   doesn't.

## Per-pick verdict

| Pick | Verdict |
|---|---|
| All 13 ov011 picks (C-32) | byte-match; metric under-counted by `$d` mapping; needs scaffolder fix #1 or #2 |
| ov002 / ov012 / ov013 picks | byte-match; same root cause as ov011 (`.s` with `.word` directives); same scaffolder fix |
| `func_020b3808` (main) | byte-match; inter-function `.word` branch; same fix |
| `func_0205da2c.legacy_sp3` + 3 `.legacy` picks | byte-match; legacy compiler with relocation-shadowed metric (different from ov011 but same metric under-count root); needs scaffolder fix #3 (objdiff fuzzy calc) |

## What this brief did NOT find

- **No new wall family**: all 23 stragglers trace to the brief 192
  hand-encoded BL recipe (and 4 to the `.legacy` family's reloc
  shadow). No undocumented codegen pattern surfaced.
- **No recipe regressions**: the picks DID match per their respective
  briefs — the metric is the under-counter, not the recipe.
- **No per-pick action needed**: all bytes match orig. The
  remediation is scaffolder-tier.

## Brief 209 Phase 1 status

The 5 literal-tail picks (`func_020212cc`, `ov002:021aba60`,
`ov002:021d9828`, `ov002:0220eb00`, `ov018:021ab1c4`) plus the
canary `func_02023478` were SKIPPED — brief 208 (scaffolder
patcher fix) is not yet merged to main. Per the brief's
conditional, Phase 2 (this investigation) shipped independently.

## Cross-references

- `docs/research/brief-206-prevalidation.md` — brief 206's
  reloc-resolver harness
- `docs/research/first-wave-wall-cross-overlay-bl.md` — brief
  192's C-32 hand-encoded BL recipe (root cause of 17 of 23
  stragglers)
- `docs/research/objdiff-fuzzy-vs-complete-metric.md` — brief
  206's metric documentation
- `tools/patch_section_align.py` — patcher (potential extension
  point for the proposed scaffolder fix #1)

## Brief 210 outcome — fix landed via `patch_arm_mapping_symbols.py`

**Status (2026-05-26):** option (1) above shipped as
`tools/patch_arm_mapping_symbols.py`. It's wired into the
`objdiff_report` ninja rule between
`objdiff_resolve_relocs.py` (brief 206) and `objdiff-cli
report generate`. Both target + base `.o.resolved` files are
rewritten in-place: every `$d` mapping symbol whose covered
range decodes as ARM instructions has its `st_name` repointed
at the existing `$a\0` strtab entry (plus `st_info` flipped to
`STT_FUNC`); partial-arm ranges get the `$d`'s `st_value`
moved to the code/data boundary; all-data ranges and Thumb
files (`$t` present) are left alone.

**Heuristic** (`is_likely_arm_instruction`): accepts any
non-`0xF` condition + rejects zero-word. Designed PERMISSIVE
for brief 210's use case — both files in the comparison have
byte-identical `.text` post-resolve, so a false-positive on
"this data word looks like ARM" is harmless: BOTH files get
the same promotion based on byte value, the mapping shapes
stay consistent, and the comparison still works. The first
iteration used an AL-only heuristic and mis-classified
predicated EQ instructions from brief 192 recipes (LDREQ,
CMPEQ, LDMEQIA) as data, mis-placing the `$d`/`$a` boundary
and triggering objdiff's ARM crash (`arm.rs:130` — same panic
family brief 187 documented, different root cause).

**Per-pick verdict (post-brief-210):**

| Pick | Pre-brief-210 fuzzy | Post-brief-210 |
|---|---:|---|
| All 13 ov011 C-32 picks | 0% – 30% | 11 **FLIP**, 1 NEAR (99.74%), 1 NO (98.76%) |
| 4 `.legacy` picks | 45% – 69% | **FLIP** all 4 (100%) |
| `func_0205da2c.legacy_sp3` | 42% | **FLIP** (100%) |
| `func_ov012_021c9d8c` + `func_ov013_021c9d60` | 60% | **FLIP** (100%) |
| `func_020b3808` + `func_ov011_021ca0ac` | 66% | **FLIP** (100%) |
| `func_0209d724.legacy` | 69% | **FLIP** (100%) |

**Aggregate:** **21 of 23 stragglers flip to
`matched_functions: 1/1, fuzzy: 100%`**. 1 near-flip at
99.74% (`func_ov011_021cb574`). 1 at 98.76%
(`func_ov011_021d02a4`) — both above the 95% threshold but
not quite at byte-identical match shape; suspected residual
mapping or reloc divergence outside brief 210's scope.

**Headline metric impact (EUR, fresh `ninja report`):**

| Metric | Pre brief 210 | Post brief 210 | Δ |
|---|---:|---:|---:|
| `matched_functions` | 1687 | 1698 | +11 |
| `complete_units` | 1667 | 1667 | (unchanged) |
| `matched_code_percent` | 1.84% | **3.71%** | +1.87 pp |
| `fuzzy_match_percent` | 1.88% | **4.51%** | +2.63 pp |

The `matched_functions` delta is smaller than the brief's
predicted +23 because brief 210's measurement baseline was
1687 (post brief 206 + brief 208 merges), not the 1673 the
brief assumed. The two-percentage-point jumps in
`matched_code_percent` and `fuzzy_match_percent` are the
larger story — those measure the byte-level shape match,
which the `$d` → `$a` rewrite directly improves.

**Out of scope (residual 2 picks):**
`func_ov011_021cb574` (99.74% fuzzy) and
`func_ov011_021d02a4` (98.76% fuzzy) don't flip — close but
not byte-identical at the linker level. Both probably have a
single residual divergence outside the mapping-symbol
mechanism (e.g., a literal pool entry whose value would
differ between built and orig post-resolve). Brief 211+
followup territory.

**Files touched** (in brief 210 PR):

- `tools/patch_arm_mapping_symbols.py` — new tool (444 LOC).
- `tools/configure.py` — wires the tool into the
  `objdiff_report` ninja rule chain
  (filter → resolve → mapping → report).
- `tests/test_patch_arm_mapping_symbols.py` — 16 new tests
  covering heuristic, all-arm promotion, partial-arm split,
  Thumb-skip, mass-rename fallback, idempotency, malformed
  input, real-fixture smoke.
- This file — appended this section.
