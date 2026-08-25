[//]: # (markdownlint-disable MD013)

# cm-restock-carve-13 — the `array` shape's zero-pointer subset: 201 symbols / 7,100 B (2026-08-24)

Thirteenth wave of the `cm-restock-carve` series. `cm-restock-carve-10`
sized the non-string half of the newly-visible pool at 1,825 symbols /
128,875 B, split by shape (`struct` 1,035/53,630 B, `array` 788/75,205 B,
`fnptr_table` 1/32 B, `jump_table` 1/8 B). This wave takes one shape,
finds its recipe, ships one gated worked example, then scales within
that shape — no batching across shapes, per the kickoff's explicit
instruction.

## Shape choice: `array` (75,205 B, the largest by bytes)

`array` and `struct` are the two real candidates (`fnptr_table` and
`jump_table` are single-symbol pools, `fnptr_table`'s single entry
carrying real risk the kickoff called out specifically — not this
wave's scope with only one symbol available). `array` has the most
bytes; `struct` has the most symbols (1,035 vs 788). Sampled both
before choosing:

```
python -c "... rank_data_symbols(..., shape_filter={'array'}) ..."
python -c "... rank_data_symbols(..., shape_filter={'struct'}) ..."
```

**Both shapes turned out to be dominated by embedded pointers, not
plain scalar data.** Sampling real candidates from each and
cross-checking `relocs.txt` directly (not the shape heuristic, which
only inspects byte patterns and cannot see the linker's own reloc
records) found most `array`- and `struct`-shaped symbols have real
internal outgoing relocations — genuine pointers to other addresses
within `main`, not opaque numeric data. This is exactly what the
original data-tier taxonomy predicted (`data-tier-scoping.md`'s
cluster D, "dispatch tables," was already flagged harder than cluster
C's strings/arrays) — the shape classifier's "array"/"struct" labels
describe byte-pattern *repetition*, not pointer-*freedom*, and most of
this pool's records mix small integers with embedded addresses.

**A candidate with even one internal reloc cannot be safely emitted as
raw bytes**: the reloc's target address is a real linker-resolved
value, and copying its raw (pre-relocation, or arbitrary-looking) bytes
would either be wrong today or silently break the moment anything
shifts. This is the exact same "zero outgoing relocations" gate every
prior wave in this series has used to admit a candidate — it just
excludes a much larger fraction of this pool than it ever did for
strings.

## The tractable subset: zero internal relocs

Restricting to symbols with **zero relocations sourced from inside
their own byte span** (the ground-truth check, not the shape
heuristic):

| Shape | Total | Zero-reloc | Bytes (zero-reloc) | Individually 4-aligned |
|---|---:|---:|---:|---:|
| `array` | 788 | 201 | 7,100 | 201 (100%) |
| `struct` | 1,035 | 276 | 9,468 | 266 (96.4%) |

`array`'s zero-reloc subset is *entirely* already 4-aligned at both
ends — Pattern 1 (one symbol, one declaration, no composition) applies
directly to every candidate, with none of the alignment-wall
complexity `cm-restock-carve-11`/`-12` had to navigate. That
simplicity, on top of `array` already being the larger shape by
bytes, is why this wave picked it over `struct`.

## The recipe: opaque `unsigned char[N]` byte arrays

The clean subset's actual content is genuinely mixed — some are small
integer tables, others are non-ASCII byte sequences (high-bit-set
bytes consistent with a legacy multi-byte text encoding, not the
project's ASCII string convention) that the shape heuristic correctly
declined to call `string`. **No single semantic type fits all 201
candidates**, so this wave does not invent one: every candidate ships
as a plain opaque byte array, following the project's own existing
precedent
([`src/main/data_020b46b8.c`](../../../src/main/data_020b46b8.c),
`cm-data-inference-5`: *"No consumer evidence found... left as a raw
opaque byte array rather than guessing a shape"*). Correctness here
means byte-identical reproduction, not a claim about what the data
semantically represents — a claim this wave has no evidence to make
for 201 heterogeneous records.

```c
const unsigned char data_020c363c[24] = {
    0x00, 0x40, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00,
    0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
};
```

`.data` section symbols (200 of 201) ship non-const `unsigned char[]`;
the one `.rodata` symbol ships `const unsigned char[]` — matching each
candidate's own ground-truth section, per
[[feedback_const-placement-controls-section]].

## Verification performed on all 201 candidates (scripted, not sampled)

1. **Zero internal outgoing relocations** — the admission criterion
   itself, re-verified directly against `relocs.txt` per candidate.
2. **Individually 4-aligned at both ends** — confirmed for all 201
   (Pattern 1 applies with no composition).
3. **Zero overlap against any existing `delinks.txt` TU range** (any
   status, not just `complete`).
4. **Real bytes** from `build/eur/build/arm9.bin` via
   `ModuleSections.bytes_at` — never guessed.
5. **Self-overlap check** across all 201 candidates: zero.
6. **`screen_names_against_src`** run over the full 201-name set
   before drafting anything: 62 hits, 59 under `src/main/` (EUR
   baseline), 3 under `src/usa/`/`src/jpn/` only. Every hit checked
   for whether it's a `.extern`-style reference or an actual
   conflicting definition — **zero duplicate definitions found**; all
   59 same-build hits are `.extern`/reference-style mentions from
   already-shipped Pattern-3 chunk files, i.e. real evidence of the
   reader this wave's own census already counted, not a violation.
   Every candidate gets its own individual declaration this wave (no
   absorption), so the screen's invariant — never omit a referenced
   name from its own declaration — holds trivially. The 3
   cross-region-only hits are confirmed via `configure.py`'s
   `_is_region_source_excluded` to never co-compile with the EUR
   build this wave targets.

## Canary — gated alone before any batching

`data_020c363c` (24 B, `.rodata`, the one non-`.data` candidate in the
whole tranche — deliberately picked to exercise the `const` branch of
the recipe, not just the majority case).

Shipped alone, gated alone:

```
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
==================== GATE PASS ====================
```

Proceeded to the remaining 200 candidates.

## Result: 201 symbols shipped, 7,100 bytes

Files: `src/main/data/data_<addr>.c`, one per symbol, each an opaque
`unsigned char[N]` (or `const unsigned char[N]` for the single
`.rodata` case) byte array, documenting the zero-relocation admission
check per file.

## Gate

Full 3-region clean-tree gate (`python tools/gate3.py --scope all
--clean`):

```
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
```

Same run's `pytest` stage failed on 3 pre-existing-as-of-this-diff
doc-staleness checks (dashboard, research-index, state-table — all
regenerated in this PR); a fresh `pytest -q tests` run after
regenerating is fully green:

```
3378 passed, 15 skipped, 76 subtests passed in 169.05s (0:02:49)
```

`git restore assets/` run after the clean gate (no heatmap deletions
observed this time, but checked anyway per standing discipline).

## Named-struct / Typed-array, before → after

Measured via `tools/progress.py`'s `summarize_data_readability`,
BEFORE isolated via an actual `git stash push -u` / `pop`:

| Metric | Before | After | Delta |
|---|---:|---:|---:|
| `typed_array_bytes` | `211,020` | `218,120` | **+7,100** |
| `named_struct_bytes` | `73,876` | `73,876` | **+0** |

Every file this wave declares a plain `unsigned char name[N] = {...};`
— a primitive-typed array, never a named-struct typedef — so 100% of
the delta lands in `typed_array_bytes`. `7,100 = 24` (canary) `+
7,076` (remaining 200 candidates), matching the byte total shipped
exactly.

## What this unlocks (scoping only, not this wave's to execute)

- **587 `array`-shaped symbols / 68,105 B** contain real internal
  relocations (embedded pointers) and need a genuinely different
  recipe — resolving each pointer to its target symbol and emitting
  `&target` expressions rather than raw bytes, per-field, per
  candidate. This is a materially harder lever than anything this
  wave used; parked with this diagnosis rather than iterated on, per
  the kickoff's own instruction.
- **`struct`'s own 276-symbol / 9,468 B zero-reloc subset** (266 of
  which are individually 4-aligned) is the same recipe, unattempted —
  a natural next slice within the *other* shape, still not batched
  with this wave's `array` work.
- **`fnptr_table` (1 symbol / 32 B) and `jump_table` (1 symbol / 8 B)**
  remain untouched — genuinely single-symbol pools too small to
  justify their own recipe-and-worked-example wave on their own, and
  `fnptr_table` specifically needs the screening-against-`src/`-and-
  delinks-routing care the kickoff called out, which wasn't exercised
  here since none of this wave's candidates are function-pointer
  tables.
- The 759 `struct`-shaped symbols with internal relocs (1,035 - 276)
  face the same "resolve embedded pointers" lever gap as `array`'s
  remainder.

## Cross-references

- [`cluster-c-recipe.md`](../cluster-c-recipe.md) — the `.rodata`
  strings + const arrays precedent; this wave's `array` shape is the
  "const arrays" half of that original charter, now reached via the
  data->data reader extension instead of cluster C's original
  reader-count method.
- [`../data-tier-scoping.md`](../data-tier-scoping.md) — the original
  5-cluster taxonomy; cluster D ("dispatch tables") flagged this
  pointer-heavy remainder as harder before this wave confirmed it
  empirically.
- [`cm-restock-carve-10-2026-08-22.md`](cm-restock-carve-10-2026-08-22.md) —
  the wave that sized this pool.
