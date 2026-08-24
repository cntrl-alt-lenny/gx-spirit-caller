[//]: # (markdownlint-disable MD013)

# cm-restock-carve-11 — TU composition for the non-4-aligned string pool: 46 of 3,187 symbols ship after a real EUR-breaking finding (2026-08-24)

Eleventh wave of the `cm-restock-carve` series. `cm-restock-carve-10`
sized two successors from its own fresh census; this wave takes the
first, preferred one: the 3,187 string-shaped symbols / 68,613 B that
are newly-visible (via the data->data reader attribution) but **not**
individually 4-aligned, so Pattern 1's one-declaration-per-file recipe
doesn't apply. `alignment-wall-tu-composition-recipe.md` already
proves TU composition can beat the alignment cascade; this wave
applies that proven recipe's exact preconditions to the pool, and in
the process finds a real gap in the recipe's own evidence base for
this pool's specific shape.

## The two preconditions, both non-negotiable

1. **Composed span 4-aligned at both ends.** A group of adjacent
   symbols can only be one TU if the group's start address and its
   `start + total_size` are both multiples of 4.
2. **P-50 (`codegen-walls.md`)**: composed-TU declaration order
   collapses to ascending byte size whenever the address-ascending
   size sequence is *not* itself non-decreasing -- PERMANENT, no
   source-level workaround. n=2 same-size pairs are the only shape
   confirmed safe by default (on struct/scalar types); n=2
   differing-size pairs were *believed* safe when the lower-address
   member is the same size or smaller -- this wave found that belief
   does not transfer to `char[N]` string arrays (see below); **every
   n>=3 group must be compiled and inspected before trusting, with no
   exceptions** (wave 4's finding: three separate n=4 groups, three
   different modules, three different type shapes, all reordered).

## Fresh census (own measurement, matches the inherited figure exactly this time)

Re-derived via `data_worklist.py --include-data-readers`, `main`,
`shape=string,string-ascii4`, 0 function readers, >=1 data reader, NOT
individually 4-aligned:

| | Symbols | Bytes |
|---|---:|---:|
| Target pool (fresh) | 3,187 | 68,613 |

Matches `cm-restock-carve-10`'s own sizing exactly -- no correction
needed this time (the four-wave streak of correcting an inherited
count breaks here, honestly, because the prior wave's own number was
already freshly derived and nothing has shipped against this
sub-pool since).

## Tiling the pool: maximal contiguous runs, then 4-aligned cut windows

Sorted by address, the 3,187 symbols form **256 maximal contiguous
byte-adjacency runs** (touching, no gap -- the only shape this
project's composition recipe has ever tested). Run lengths range from
1 to 183 members; only 2 symbols are entirely isolated (no touching
neighbor at all).

Within each run, greedily found the smallest 4-aligned-both-ends
window at each reachable cut point (a window can never be length 1 in
this pool, by construction -- a length-1 "window" with both ends
4-aligned would already be individually 4-aligned, which is exactly
what this pool excludes):

| Class | Windows | Symbols | Bytes | Disposition |
|---|---:|---:|---:|---|
| n=2, same size | 23 | 46 | 1,060 | **Shipped this wave** -- proven safe, canary + full clean gate both pass |
| n=2, differing size (ascending) | 8 | 16 | 396 | **Declined this wave** -- new finding below; not safe for `char[N]` arrays as tested |
| n=2, size *decreasing* | 17 | 34 | 668 | **Declined** -- P-50, permanent, no workaround |
| n>=3, geometrically composable | 576 | 3,069 | 66,096 | **Deferred** -- needs per-group compile-and-inspect verification the standing rule requires; not attempted this wave |
| Unreachable from run start | -- | 22 | 393 | Run doesn't begin (or continue) at a 4-aligned point; needs the untested backward-absorption half, not this recipe |

**Only 46 of 3,187 symbols (1,060 of 68,613 bytes -- 1.4% of the
symbols, 1.5% of the bytes) shipped this wave.** This came down from
an initial 62/1,456 estimate once the differing-size n=2 class was
actually tested rather than assumed (see below). Most of the pool is
*geometrically* composable (576 of the 602 non-trivial windows have
>=3 members) but this project's own standing rule -- established the
hard way in wave 4, when three separate n=4 groups from three
different modules all silently reordered despite a correct section
size -- forbids trusting an n>=3 group without compiling and
inspecting its `.o` symbol table first. That verification work (a
per-group standalone compile + symbol-table check, no full link
needed) is real but wasn't attempted this wave; it's the natural next
wave's scope, potentially with a purpose-built tool rather than 576
manual checks.

The 17 P-50-walled (descending-size) pairs are a small, mechanically
clean minority -- permanently blocked by this recipe, same as
`cm-restock-carve-1`'s declined `kv_t` symbols and
`cm-restock-carve-5`'s declined `data_ov011_021d3034`/`_021d305f`
pair.

### New finding: the ascending-size n=2 exception does not transfer to `char[N]` string arrays -- caught by the canary-then-tranche discipline exactly as designed

The kickoff's canary was one of the 23 same-size windows (the
strongest-evidenced case). It passed. The subsequent full-tranche
`--clean` gate -- all 31 windows, including the 8 ascending-size
differing-size ones -- **failed EUR's SHA1 with a 93-million-byte
divergence** (the ROM header's own ARM9-size field diverged at byte
`0x2c`; `dsd check modules` failed every single module, ARM9 main
through overlay 23 -- a file-layout-shift signature, not a localized
content bug). USA and JPN passed (those regions never compile
`src/main/`, so they were structurally unaffected -- see
`configure.py`'s `_is_region_source_excluded`).

Bisected by testing "23 same-size only" against a known-good baseline
(clean EUR build: **PASS**), then narrowing to the 8 differing-size
windows. Root-caused via direct standalone compilation
(`arm-none-eabi-objdump -h` on the pre-link `.o` -- the same
"inspect-before-linking" method the alignment-wall recipe itself
established, just run at the compile stage instead of after a full
link): **a `char[N]` global initialized from a string literal
compiles to its OWN separate `.data` section entry per declaration --
never one merged section with internal symbol offsets**, unlike the
struct-typed globals `alignment-wall-tu-composition-recipe.md`'s
worked examples used (that doc's own "in-section offset" language
describes a merged-section outcome this project's `char[N]` arrays do
not produce). Confirmed on both a same-size pair (two 22-byte `.data`
sections in one `.o`) and a differing-size pair (17-byte + 27-byte
sections) -- the section-per-declaration behavior is identical either
way, so it isn't itself the cause of the divergence. The actual
trigger is whatever the link step does when concatenating multiple
same-named `.data` sections from one object file when their sizes
differ: same-size sections merge in a way that's evidently
order-preserving for this project's byte-identity purposes,
differing-size ones are not, and the failure manifests as a ROM-wide
layout shift rather than a contained few-byte mismatch. This is a
**materially different failure mode** than P-50 (which is about
symbol offsets *within* one section, a link-time-only divergence);
in severity it is closer to the W6 `.rodata`-cascade class
(`cluster-c-recipe.md`) while being a distinct mechanism.

**Standing rule addition**: `alignment-wall-tu-composition-recipe.md`'s
"n=2, non-decreasing size is safe by default" claim is now scoped --
confirmed only for the struct/scalar types it was originally tested
on. For plain arrays initialized from a literal (this pool's entire
shape), **only same-size n=2 pairs are safe by default**; a
differing-size pair, even address-ascending, must be compiled and
inspected standalone before trusting, exactly like every n>=3 group
already required. The 8 declined pairs above are parked, not
disproven for all time -- a future wave could still find a safe form,
but not this exact declare-two-arrays-in-one-file shape without
per-pair verification.

## Verification performed on the 46 shipped symbols (all 23 windows, not sampled)

1. **Window boundaries**: both ends of every composed span verified
   4-aligned (by construction, re-checked).
2. **Zero internal outgoing relocations** from inside *either* member's
   own byte span, for all 23 windows.
3. **Zero overlap against any existing `delinks.txt` TU range** (any
   status, not just `complete`).
4. **Real bytes** from `build/eur/build/arm9.bin` via
   `ModuleSections.bytes_at`, per member.
5. **Content check**: last byte zero, all padding after the first NUL
   also zero, printable-ASCII prefix -- same discipline as
   `cm-restock-carve-9`/`-10`. Zero members needed string-literal
   escaping.
6. **Self-overlap check** across all 23 windows: zero.
7. **`screen_names_against_src`** run over the full candidate name set
   before drafting anything (the mandatory precondition, standing from
   `cm-restock-carve-10`) -- zero hits outside each candidate's own
   soon-to-be-written file (i.e. genuinely zero external references
   anywhere in `src/`). Every member gets its own top-level
   declaration in this wave too -- no absorption, so the screen's
   invariant holds trivially, same conclusion as wave 10.

All 23 windows are `.data` section, non-const, matching the established
convention.

## Canary -- gated alone before any batching

`data_020c6f64` (22 B, `"pack_ef_00_matanm.bin"`) +
`data_020c6f7a` (22 B, `"pack_ef_00_texanm.bin"`) -- the strongest
instance of the pattern available (equal-size members, the shape
confirmed safest by the widest evidence base). Composed span
`0x020c6f64`-`0x020c6f90` (44 B), 4-aligned at both ends.

Shipped alone, gated alone:

```
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
==================== GATE PASS ====================
```

The composition preconditions are satisfied for a same-size pair --
proceeded to batch the remaining same-size windows. (The differing-size
windows were batched alongside them in the same tranche gate and
caused the failure described above; they were removed before the
final, reported gate run.)

## Result: 23 windows / 46 symbols shipped, 1,060 bytes

Files: one `.c` per window at `src/main/data/data_<first-addr>.c`,
declaring both members as separate top-level `char name[N] = "…";`
globals in address order, documenting per-member readers and the
same-size safety argument for that window.

## Gate

Full 3-region clean-tree gate (`python tools/gate3.py --scope all
--clean`), final state (23 shipped windows, 8 differing-size windows
removed after the finding above):

```
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
```

Same run's `pytest` stage failed on the 2 pre-existing-as-of-this-diff
doc-staleness checks (state-table + research-index; both regenerated
in this PR). A fresh `pytest -q tests` run after regenerating is fully
green:

```
3334 passed, 15 skipped, 76 subtests passed in 75.65s (0:01:15)
```

`git restore assets/` run after the `--clean` gate (no heatmap SVG
deletions observed this time, but checked anyway per standing
discipline).

## Named-struct / Typed-array, before -> after

Measured via `tools/progress.py`'s `summarize_data_readability`,
BEFORE isolated via an actual `git stash push -u` / `pop`:

| Metric | Before | After | Delta |
|---|---:|---:|---:|
| `typed_array_bytes` | 209,960 | 211,020 | **+1,060** |
| `named_struct_bytes` | 73,876 | 73,876 | **+0** |

Every file this wave declares two plain `char name[N] = "…";` globals
-- primitive-typed arrays, never a named-struct typedef -- so 100% of
the delta lands in `typed_array_bytes`. `1,060 = 44` (canary) `+
1,016` (remaining 22 windows), matching the byte total shipped
exactly.

## What this unlocks (scoping only, not this wave's to execute)

- **3,069 symbols / 66,096 B** sit in geometrically-valid n>=3 windows
  and are the natural next wave's target -- but need per-group
  standalone-compile-and-inspect verification first, at scale (576
  groups), not a blanket trust extrapolated from this wave's n=2
  result. A purpose-built tool that compiles each candidate `.o`
  standalone and checks section/symbol-table ordering programmatically
  (no full link) would make this tractable; doing it by hand for 576
  groups would not be a "bounded" wave.
- **16 symbols / 396 B** (the 8 declined differing-size pairs) need
  either a different composition form or per-pair standalone
  verification before they can ship -- do not assume the ascending-size
  exception applies to `char[N]` arrays without re-testing each one.
- **34 symbols / 668 B** are permanently walled by P-50 (descending
  n=2 pairs) -- no further recipe work will reach them via composition.
- **22 symbols / 393 B** need the untested backward-absorption half of
  the composition question, flagged but not solved since wave 3.
- `cm-restock-carve-10`'s item (2) -- 1,825 non-string-shaped symbols /
  128,875 B needing shape-specific recipes -- remains fully untouched;
  out of this wave's scope by the kickoff's own stated preference.

## Cross-references

- [`alignment-wall-tu-composition-recipe.md`](../alignment-wall-tu-composition-recipe.md) --
  the recipe this wave applied, and now scopes: the differing-size n=2
  exception is confirmed only for struct/scalar types, not `char[N]`
  string arrays.
- [`../codegen-walls.md`](../codegen-walls.md) -- P-50, the permanent
  wall behind the 17 declined descending-size pairs.
- [`cm-restock-carve-10-2026-08-22.md`](cm-restock-carve-10-2026-08-22.md) --
  the wave that sized this pool.
