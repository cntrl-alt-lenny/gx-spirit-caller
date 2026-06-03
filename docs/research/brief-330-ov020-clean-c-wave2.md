[//]: # (markdownlint-disable MD013 MD041)

# Brief 330 — ov020 wave 2: register-reshape pass + clean-C mop-up

**Brief:** 330 (decomper, Windows lane; permuter parked). Re-attack the ov020
`§WALL` reg-alloc/scheduling near-misses (catalogued brief 328) with the
register-RESHAPE recipe the scaffolder proved on ov005 wave 2 (if-assign
min/max, bind call result to temp, reuse param in place, branch-tail
duplication) — no permuter, runs on Windows. Report how many catalogued walls
were actually reshape-able (Windows-reachable vs genuinely Mac-only).

## Headline answer — 0 of the catalogued §WALL misses were reshape-able

**The ov005 reshape recipe does NOT transfer to ov020's walls.** ov020's
catalogued misses are scheduling/allocator class, not the register-CHOICE class
the recipe moves. Tried and confirmed resistant:

- **OBJ-dispatch stack-arg family** (`021ab8f8` seed): three recipe levers —
  bind-handle-to-temp, bind-field-to-temp, reuse-param-in-place — **all give
  byte-identical 59%**. The whole tail matches; mwcc HOISTS the `data_ae060`
  pool load (fragmenting r0 so the `(idx*0x28+K)<<12` temp differs). That is a
  scheduling reorder, not a register choice — source shape can't move it.
- **Inline tilemap-fill nested loops** (`021aae64` …): pure register *rotation*
  of `{row,p,tile,col}`, but the orig reuses a held zero (`mov r1,lr; mov ip,r1`)
  for the per-pass `col` init — an allocator artifact with no matching recipe
  lever (declaration reorder makes it *worse*, brief 328).

**Conclusion for the strategy: this slice of the wall is genuinely Mac/permuter-
only.** The reshape recipe is real (it worked on ov005) but ov005's misses were
register-CHOICE; ov020's are scheduling/allocator. The medium-tier bottleneck is
heterogeneous — reshape-ability must be judged per-overlay, not assumed.

## What DID ship — 6 clean-C mop-up matches

Per the brief ("if reshape-able picks dry up below ~3, mop up any remaining
clean-C in ov020"), I pivoted to clean-C that wave 1 deferred as *medium*
(NOT walls). **6 shipped, all EUR objdiff fuzzy 100% + EUR `ninja sha1` OK.**

| # | func | size | shape |
|---|---|---|---|
| 1 | `021aab7c` | 0x74 | BG-config builder (seed) |
| 2 | `021aabf0` | 0x88 | BG-config builder (branch-select arc) |
| 3 | `021aac78` | 0x98 | BG-config builder (+fc/f10, clear-mosaic) |
| 4 | `021aa9e8` | 0x98 | BG-config builder (+palette blit) |
| 5 | `021aa67c` | 0x50 | path / lang-byte builder (3-bit bitfield) |
| 6 | `021ab798` | 0x44 | 2-call layout-metrics accessor |

### Recipe levers that DID land here (clean-C, not the §WALL)

- **Field store-order** (BG-config family, the headline): a 0x28-byte stack
  `BgCfg` filled by `func_0201d47c`, then f14/f18/f0 bitfield writes, committed
  by `func_0201e5b8`. The seed shipped at **93%** with one diff — the final `f0`
  and `f14` stores were swapped. Writing `cfg.f0 = h;` *before* the second
  `cfg.f14 = …;` flipped it to **100%**. The 4-member family then cloned by
  transcribing each one's bitfield literals + store order. (cfg's address
  escapes to d47c, so mwcc re-reads f14 between its two writes — no `volatile`.)
- **Branch-tail duplication** (`021aabf0`/`021aac78`): the archive offset is
  picked by `if (sel==3) h=open(+A); else h=open(+B);` — two self-contained
  calls, matching the orig's duplicated `bl` (a ternary would merge to one bl).
- **Bitfield for shift-extract** (`021aa67c`, gotcha 25): the 3-bit region
  selector must be a real `unsigned r:3` bitfield to emit `lsl#29;lsr#29`; a
  plain `& 7` folds to `and #7`.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff fuzzy, per-pick | **6/6 = 100%** |
| EUR `ninja sha1` | **OK** (byte-identical ROM with all 6 carved) |
| ov020 `delinks.txt` | 6 `complete .text` blocks appended (EUR only) |
| reshape attempts on §WALL | 0 flipped (3 levers × OBJ-dispatch, all 59%) |
| 3-region `ninja sha1` | **deferred to brain** |

EUR-only config; no tool change, no USA/JPN config change, no renames.
`src/overlay020/` gains 6 `.c`; `ov020_core.h` §VERIFIED + §WALL updated.

## Recommendation for the brain

1. **ov020's §WALL is Mac-only — stop trying to reshape it on Windows.** The
   OBJ-dispatch family (5 funcs + variant) and inline-fill (4 funcs) are
   pre-characterised permuter inputs; route them to the Mac lane.
2. **Reshape-ability is per-overlay.** ov005 yielded to the recipe; ov020 did
   not. Before committing a reshape wave, spot-check one near-miss for
   register-CHOICE (movable) vs scheduling/allocator (Mac-only).
3. **ov020 remaining clean-C is thinning** — wave 2 took the last small
   tractable picks (BG-config family, accessors). The residue is big
   constructors (`021aaeac`/`021ab1dc`/`021ab4a0`/`021ac4fc` …, 0x100–0x1000)
   + the §WALL. Suggest pivoting the next clean-C wave to a fresher overlay
   (ov017) and reserving ov020's tail for the Mac permuter.

## Cross-references

- `docs/research/brief-328-ov020-clean-c-wave1.md` — wave 1 + the §WALL census.
- `src/overlay005/ov005_core.h` §VERIFIED — the reshape recipe (worked there).
- `src/overlay020/ov020_core.h` — updated vocabulary + wall census.
