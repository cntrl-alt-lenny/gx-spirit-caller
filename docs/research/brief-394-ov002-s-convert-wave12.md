[//]: # (markdownlint-disable MD013 MD041)

# Brief 394 — ov002 reg-alloc → `.s`, upper-half wave 12

**Brief:** 394 (scaffolder). Continue the ov002 upper-half `.s`-bound reg-alloc
backlog from waves 1–11 (= 88 ships). The decomper moved to ov004, so the
scaffolder is now the **sole owner** of `ov002/delinks.txt` — no more collision,
but keep using `tools/sort_delinks.py` so the file stays canonically
address-sorted. Per-pick `asm_escape` byte-identity + `kind:bss` link check;
EUR `ninja sha1` gate. Target ~8.

## Headline — 8 upper-half `.s` shipped (0x40–0x48), EUR `ninja sha1` green

**8 byte-exact upper-half ov002 `.s` shipped**, all link-clean (every `data_`
reference is `kind:bss`; 5 of 8 carry no data ref at all). Lossless carve
(ov002 `.s` func-entry set 233 → 241 = +8 exactly, file address-sorted), EUR
`ninja sha1` **OK**. USA/JPN unaffected **by construction** (the region filter
makes `src/overlay002/*.s` EUR-only; the only config change is under
`config/eur/`).

## The 8 ships (all ov002, upper half ≥ 0x02234000)

| addr | size | bl | data ref (kind) |
|---|---|---|---|
| `022bdb44` | 0x40 | 1 | — |
| `02240efc` | 0x48 | 2 | — |
| `02273ad4` | 0x48 | 3 | `022cd300` (bss) |
| `0228ac74` | 0x48 | 1 | `022ce288` (bss) |
| `0228c81c` | 0x48 | 2 | `022cd524` (bss) |
| `02295b08` | 0x48 | 2 | — |
| `0229e14c` | 0x48 | 1 | — |
| `022a8ca8` | 0x48 | 8 | — |

All `asm_escape --whole-function` → `✅ whole-function .s byte-identical vs the
delinked .o`. These are genuine reg-alloc walls: early-return value-in-reg
ordering + bound-checks (`02240efc`), bitfield-extract → dispatch with
branch-to-shared-epilogue (`02273ad4`), guard-chain inline-vs-branch
(`0228ac74`), and a same-arg call sequence whose r0-reload-vs-reuse mwcc can't
be steered to (`022a8ca8`). No byte-pack.

## Per-pick verification — the `kind:bss` link gate (classifier sweep)

Swept the 26 smallest uncarved upper-half candidates through
`asm_escape --whole-function` + a global symbol→kind lookup. **24/26 CLEAN**
(byte-identical with every `data_` extern resolving to `kind:bss`), matching the
brief's "~100 % with the store-merge fix". The **2 drops** both reference a
`kind:data(any)` symbol (would `Undefined`-fail the link gate, per brief 361/364
— the comparator wildcards relocs but the linker needs the symbol):

| dropped | offending ref | kind |
|---|---|---|
| `02297c3c` | `data_ov002_022c9508` | data |
| `0229a060` | `data_ov002_022ca370` | data |

(`0229a060` also refs `02104f4c` which *is* bss — one `kind:data` ref is enough
to drop.)

## Lossless carve audit

| metric | before | after | Δ |
|---|---|---|---|
| ov002 `.s` func-entries | 233 | 241 | +8 |
| ov002 total func `.text` entries | 1127 | 1135 | +8 |

`sort_delinks.py`: appended 8 blocks (2 inversions vs the sorted file) →
re-sorted to **0 inversions**. The delinks diff is **32 insertions, 0
deletions** — the file was already address-sorted, so the 8 blocks slotted in
as pure interleaved insertions (confirms the decomper-left / sole-owner state;
no reordering churn). `dsd` is block-order-agnostic, so the sort is pure
merge-hygiene; `ninja sha1` confirms the file links byte-identically.

## Gate — `ninja sha1`

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **unaffected** | **unaffected** |

EUR: `gx-spirit-caller_eur.nds: OK` (byte-identical) with all 8 carved. USA/JPN:
`_is_region_source_excluded` returns `region != "eur"` for no-region-prefix
paths (`configure.py:1176`), so `src/overlay002/*.s` is excluded from those
builds; the config change is under `config/eur/`. Nothing in the USA/JPN build
changed. The brain reproduces the full 3-region SHA1 on merge.

## Worktree hygiene — removed 13 stale untracked `src/main/*.c`

The scaffolder worktree carried **13 untracked `src/main/func_*.c`** files dated
Jun 6 (an abandoned main-stragglers C session), and the Jun-6 `build.ninja`
referenced them. They are a **duplicate-symbol hazard**: 7 of the 13 addresses
are already carved in `arm9/delinks.txt` as `.s` (shipped by the main reg-alloc
→ `.s` waves, e.g. brief 372), and the other 6 are uncarved gap funcs — either
way the globbed `.c` would collide with the committed `.s` / the gap object.
**Preserved** to `/tmp/spirit-caller-stale-main-c-20260606/` and removed from
the tree, then **reconfigured** (`python3.13 tools/configure.py eur`) to
regenerate a clean graph. Baseline `ninja sha1` re-verified **OK** *before* any
wave-12 change, so the green gate is attributable to this wave alone.

## Thinning watch — NOT thinning

Uncarved upper-half `≤0x60`: **83** entries (incl. 5 `__sinit_*` thunks +
2 `kind:data` drops → ~**76** shippable funcs). 8 shipped → **~68 remain** =
**~8 waves** of runway at this band; past `0x60` widens it. The classifier's
24/26 clean rate says the vein is still healthy.

## Files

`src/overlay002/` +8 `.s`; `arm9/overlays/ov002/delinks.txt` +8 blocks
(sort-normalised). No main/USA/JPN source or delink change (the 13 `.c`
removals were untracked cruft, not committed state). Running total scaffolder
reg-alloc `.s`: **96** (main 17, ov002 upper-half 79).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
