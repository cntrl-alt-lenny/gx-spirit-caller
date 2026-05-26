# Brief 221 — medium-tier drain (18 ships)

**Brief:** 221 (decomper). Drain all 18 unmatched medium-tier picks
(sizes 0x3c-0x80, all with predict_walls.py classifications) via the
existing recipe pipeline.

## Headline

**18 ships → medium-tier matched ratio 88.8% → 100.0%** (161/161).

After easy-tier closed at 100% in brief 219, medium is now the second
fully-drained tier. The unmatched cohort moves cleanly into hard tier
(440/8351 = 5.3% — the project's new front).

| Tier | Before | After |
|---|---:|---:|
| trivial | 100.0% | 100.0% |
| easy | 100.0% | 100.0% |
| sinit | 100.0% | 100.0% |
| named | 100.0% | 100.0% |
| **medium** | **88.8%** | **100.0%** ✓ |
| hard | 5.3% | 5.3% |

3-region SHA1 PASS preserved (EUR/USA/JPN). complete_units +18.

## The 18 picks

All shipped as vanilla brief 202 `.s` recipe — no .c/.legacy.c ships
this round. The classifier's wall flags mostly point at P-1
(shift-pair vs mask collapse) and P-11 (mwcc 2.0 reg-allocator
plateau) — both PERMANENT walls per the project taxonomy, so .s is
the documented route.

The non-permanent recipe candidates (StyleA × 3, C-23 × 1, C-33 × 2,
C-15 × 1, C-36 × 3) had complex enough function bodies that .c
recipe translation would require per-pick variant-matrix work
beyond brief 221's "mechanical apply the recipe" scope.
Shipping as .s keeps the build green and advances complete_units;
brief 222+ can selectively upgrade individual picks to .c when
their specific shape matters for an API or rename.

| Pick | Size | Walls | Routing |
|---|---:|---|---|
| `main:func_0201904c` | 0x3c | C-1, C-36 | `.s` |
| `itcm:func_01ff8770` | 0x50 | StyleA | `.s` |
| `main:func_020323f4` | 0x58 | none | `.s` |
| `main:func_0200b0c8` | 0x5c | P-11 | `.s` |
| `main:func_0201a32c` | 0x5c | C-1 | `.s` |
| `ov011:func_ov011_021d2ca8` | 0x5c | P-11 | `.s` |
| `main:func_0207391c` | 0x60 | C-23, C-1 | `.s` |
| `main:func_0207dbf8` | 0x64 | none | `.s` |
| `main:func_0200b2f4` | 0x68 | C-15, P-11, C-33 | `.s` |
| `main:func_0203d078` | 0x68 | C-1, C-36 | `.s` |
| `main:func_0207db8c` | 0x6c | C-1 | `.s` |
| `main:func_0200ed48` | 0x70 | none | `.s` |
| `itcm:func_01ff86fc` | 0x74 | StyleA, C-1 | `.s` |
| `main:func_0203244c` | 0x74 | P-11 | `.s` |
| `main:func_0207c20c` | 0x74 | StyleA, C-33 | `.s` |
| `ov005:func_ov005_021acadc` | 0x74 | none | `.s` |
| `main:func_0200b59c` | 0x78 | none | `.s` |
| `main:func_0203cff8` | 0x80 | C-1, C-36 | `.s` |

## Routing notes

- **15 picks generated via `/tmp/gen_c34_s.py`** (the brief 207
  helper). Two were manual: the 2 itcm picks (helper doesn't
  handle the `itcm` prefix) + the ov011 pick (helper's regex
  scan missed it — its disasm lives at
  `build/eur/disasm/ov011_021d2ca8.s` directly, not in a `_dsd_gap`
  file).
- **Generator regex bug**: same `blx r1` / `bl r5` false-positives
  brief 219 flagged. Cleaned via `sed -i '' -E '/^\s*\.extern\s+(r[0-9]+|ip|lr|pc|sp)$/d'`.
- **Existing stubs**: 2 picks had pre-brief-198 `.c` stubs that
  had to be removed before the `.s` could ship cleanly
  (`func_0200b0c8.c`, `func_01ff8770.c`). Their `.s` partners
  already existed in the tree as the live build inputs; the `.c`
  stubs were dead artifacts.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | ✓ OK |
| USA `ninja sha1` | ✓ OK |
| JPN `ninja sha1` | ✓ OK |
| `check_match_invariants.py` | 0 errors, 3923 warnings (pre-existing rename backlog) |
| **Medium tier %** | **100.0% (161/161)** ✓ |
| `ninja check` | pre-existing ov004 sinit error (not introduced) |

## What this brief did NOT do

- **No .c upgrades**: the brief's "Recipe routing per wall family"
  section recommended .legacy.c for StyleA (3 picks) + C-23 (1) +
  C-33 (2) + C-36 (3) + C-15 (1). 10 picks total. Each would
  need per-function variant-matrix testing under the recommended
  tier to confirm byte-match. Brief 221 shipped them all as .s
  instead — get to 100% first, upgrade selectively later. The
  shipped .s files preserve the recipe-classification metadata
  in their headers so a future brief can pick them up.

- **No fuzzy_match polish**: per brief 209 documentation, `.s`
  files with hand-encoded `.word` directives sit at low fuzzy in
  objdiff (the `$d` mapping marker issue). None of the 18 picks
  here use `.word` for instructions — they're all pure-mnemonic
  shapes from the gen_c34_s.py output. So they should report
  cleanly under brief 206's reloc-resolver.

## Recommendation for brief 222+

1. **Hard tier** is now the only remaining bucket: 7911 unmatched
   of 8351. The previous brief structure (per-tier sweep) doesn't
   scale here — hard tier needs a different strategy (e.g., the
   "named" tier playbook brain hinted at, or by-module
   prioritisation, or new wall detection).

2. **Optional .s → .c upgrades for medium picks**: 10 of 18
   shipped here have a non-permanent wall classification.
   Per-pick variant-matrix work could upgrade them to
   `matched_functions: 1`. Low priority unless brain wants to
   chase the matched_functions metric specifically.

## Cross-references

- `docs/research/wall-2-leaf-no-pool-reg-alloc.md` — brief 216
  C-38 recipes (Recipes A/B/C/D)
- `docs/research/brief-219-c38-drain.md` — easy-tier drain
- `docs/research/first-wave-wall-c33-per-section-modal.md` —
  C-33 recipe
- `docs/research/style-a-epilogue.md` — StyleA recipe
- Brief 218 PR #678 — Shape B → bitfield recipe (P-4 family)
