[//]: # (markdownlint-disable MD013)

# cm-restock-carve-14 — carving the pointer tables themselves: 167 single-pointer records / 2,004 B (2026-08-25)

Fourteenth wave of the `cm-restock-carve` series. `cm-restock-carve-12`
(#1561) proved TU composition dead (0 of 575 windows pass; same-size
doesn't generalise past n=2 either). `cm-restock-carve-13` (#1565)
shipped the array shape's zero-internal-reloc subset and reported why
it was only 201 of 788: both `array` and `struct` are dominated by
embedded pointers, not plain scalar data. This wave takes that
remainder head-on: carve the pointer-bearing tables with real symbol
references instead of raw bytes, so the reference survives at the
source level instead of being flattened into opaque hex.

## Part 1 — census: honestly, not the pool this campaign hoped for

**Fresh re-derivation, not `cm-restock-carve-10`'s inherited figures.**
Other lanes have shipped array/struct-shaped candidates independently
since wave 10/13 were written (this campaign is one of several
concurrent data-tier lanes), so the pool has moved. Re-derived directly
against this branch's `config/eur`:

| Shape | Total unmatched | Zero internal reloc | **With internal reloc** | Bytes (with-reloc) |
|---|---:|---:|---:|---:|
| `array` | 659 | 4 | **655** | 70,361 |
| `struct` | 1,042 | 276 | **766** | 44,354 |
| **Total** | **1,701** | **280** | **1,421** | **114,715** |

(`fnptr_table`/`jump_table` unchanged at 1 symbol each, 32 B / 8 B —
still too small for their own wave, per `cm-restock-carve-13`'s own
note.)

**PURE pointer tables (every 4-byte word in the span is itself a
relocated pointer — the D-1 signature from
[`cluster-d-recipe.md`](../cluster-d-recipe.md)): zero.** Checked
directly, not assumed: for every one of the 1,421 with-reloc
candidates, tiled its span into 4-byte words and required each word to
carry exactly one `kind:load` relocation sourced at that exact offset.
**1,417 of 1,421 fail on "word has 0 relocs" (a genuine gap between
pointer fields) and the remaining 4 fail on "size not a multiple of
4."** D-1's easy shape — the campaign has already drained it across
waves 8-13; what is left matches
[`cluster-d-recipe.md`](../cluster-d-recipe.md)'s own **D-3** signature
exactly: "a mix of pointer relocs + integer fields," flagged there as
HIGH difficulty and deferred pending "typedef-inference tooling."

**If the pure-pointer-table population turns out small, that is the
finding** — and it is not small, it is **zero**. Four waves running
have corrected an inherited count; this is the fifth, and this time
the correction is total: the "pointer tables" this wave was scoped to
carve properly do not exist as an all-pointer shape anymore. What
remains is D-3's mixed shape.

### The tractable D-3 sub-case: exactly one embedded pointer

Restricting the 1,421 D-3-signature candidates to those with **exactly
one** internal relocation (the simplest possible D-3 record — one
pointer field, not N) and requiring the pointer's target to resolve to
an **exact** symbol-start address (so `&target` is unambiguous, no
interior-offset guessing):

**548 candidates / 19,343 B.** All 548 target `data`-type symbols —
**zero target functions**, so the fnptr-specific thumb/arm-mode
caution this wave was warned about does not arise for this sub-shape
at all (it would matter for a genuine fnptr-adjacent slice this wave
didn't touch). 171 of 548 targets are already matched (real `.c`
declarations elsewhere); 377 are still open placeholders. Per the
settled `extern char X;` recipe
([`cluster-b-pointer-pool.md`](../cluster-b-pointer-pool.md)), this
distinction doesn't gate correctness — confirmed on the canary below,
which deliberately targets a still-open pointee.

**One (size, offset) shape dominates**: **168 candidates are exactly
12 bytes with the pointer at the last word (offset +8)** — an 8-byte
opaque prefix followed by one pointer, 31% of the 548-candidate pool
concentrated in a single, uniform layout. Inspecting the addresses
shows why: **144 of the 167 address-gaps in this subclass are exactly
12 bytes** — most of this shape is a contiguous run that `symbols.txt`
represents as one placeholder per 12-byte element rather than one
array symbol, not 168 unrelated coincidences. One record in the 168 is
self-referencing (its own pointer field targets itself) — parked, not
attempted this wave (a same-TU self-address initializer is legal C but
a different recipe shape than the other 167, not worth a special case
for one 12-byte record).

**This wave's scope: the 167 non-self-referencing (size=12,
offset=+8) records — 2,004 B.** Single shape, single recipe, per the
kickoff's explicit "no batching across shapes" instruction. The
remaining 380 single-pointer D-3 records (other size/offset
combinations) and the 873 multi-pointer D-3 records are parked with
this diagnosis, not attempted.

## Part 2 — the recipe, proven on one table gated alone

Generalises the already-settled
[`cluster-b-pointer-pool.md`](../cluster-b-pointer-pool.md) singleton
recipe (`extern char X; void *Y = &X;`, proven on standalone 4-byte
slots) to a 12-byte record with an 8-byte opaque prefix:

```c
typedef struct {
    unsigned char pre[8];
    void *target;
} PtrRecord12_8;

extern char data_020c7920;

PtrRecord12_8 data_020c7954 = {
    { 0x01, 0x00, 0x00, 0xf2, 0x00, 0x00, 0x00, 0xf8 },
    &data_020c7920,
};
```

- **No `const`**: ground truth section for every one of the 548
  single-pointer candidates (and all 167 in this wave's tranche) is
  `.data`, not `.rodata` — confirmed directly, not assumed. This
  wave's ⚠️ `void *const` caution (needed only when a pointer-bearing
  object must land in `.rodata`) doesn't arise here; noted for a
  future wave that does touch `.rodata` pointer tables.
- **Opaque `unsigned char pre[8]`**: no consumer evidence for a finer
  field split (could be two `u32`s, four `u16`s, or genuinely
  arbitrary bytes) — matches this project's standing "don't invent
  structure you can't prove" convention.
- **The pointer field is a real symbol reference**, not a raw address
  literal: `mwldarm` emits the relocation at link time, so the value
  is correct in all 3 regions even though the pointee's address
  differs per region — the same reason
  [`cluster-b-pointer-pool.md`](../cluster-b-pointer-pool.md) rejected
  a literal-cast alternative outright.
- **Canary deliberately targets a still-open pointee**
  (`data_020c7920`, unmatched) rather than an already-`.c` one, to
  exercise the kickoff's explicit caution about a target's routing
  state head-on rather than picking the easy case.

Canary gated alone, full 3-region clean gate, before any tranche.
(Process note: the canary's own gate run passed — confirmed via
`gate3.py`'s verdict logic, which only prints "diverging region(s):"
when a region fails, and that line was absent — but its actual
`[eur/usa/jpn] SHA1 PASS` text was lost to an operator error piping
through `tail -40` on a run that exceeded the foreground timeout. The
tranche gate below re-verifies the canary too, since it's part of the
same tree, and its output was captured in full.)

## Part 3 — bounded tranche

The remaining 166 records of the same (size=12, offset=+8) shape,
same recipe, one file per symbol — matching every prior wave's
one-declaration-per-symbol convention. 24 distinct pointer targets
across the 167 records (one target shared by as many as 58 records —
consistent with a shared generic handler/config pointer across many
per-instance records).

Verification performed on all 167 (scripted, not sampled):

1. Exactly one internal outgoing relocation, `kind:load`, word-aligned.
2. Pointer target resolves to an **exact** symbol-start address (no
   interior-offset ambiguity).
3. Zero self-overlap across the 167 candidates.
4. Zero overlap against any existing **complete** `delinks.txt` TU
   range (gap-TU ranges excluded from this check — they are, by
   definition, exactly what this wave carves out of).
5. Real bytes from `build/eur/build/arm9.bin` via `ModuleSections.bytes_at`.
6. `screen_names_against_src` run over all 167 candidate names AND all
   24 distinct target names before drafting anything — the kickoff's
   explicit "screen every target" ask, not just the candidates. 4
   target hits, all self-references from the target's own existing
   declaration (e.g. `data_020e27b8`'s brief-143 `int` declaration);
   zero conflicting definitions.
7. Every target's type is `data` (zero `function` targets in this
   sub-shape) — the `.s`-function-sibling caution the kickoff raised
   does not apply to this tranche; flagged for whichever future wave
   does carve a function-targeting D-3 record.

Full 3-region clean gate (canary + tranche together, all 167 files):

```
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
```

That run's `pytest` stage failed on the 3 doc-staleness checks this
diff's content invalidates (dashboard, state-table, research-index —
all regenerated below); a fresh `pytest -q tests` run after
regenerating is fully green:

```
3419 passed, 15 skipped, 76 subtests passed in 225.87s (0:03:45)
```

`git restore assets/` run after the clean gate (`gate3.py --clean`
deleted `assets/progress-heatmap-{usa,jpn}.svg` as usual).

## Named-struct / Typed-array, before → after

Measured via `tools/progress.py`'s `summarize_data_readability`,
BEFORE isolated via a real `git stash push -u` / `pop`:

| Metric | Before | After | Delta |
|---|---:|---:|---:|
| `typed_array_bytes` | `218,120` | `218,120` | **+0** |
| `named_struct_bytes` | `73,876` | `75,880` | **+2,004** |

Every file this wave declares a `typedef struct {...} PtrRecord12_8;`
+ a bracket-less instance (`PtrRecord12_8 data_X = {...};`, no `[N]`
on the instance itself) — the "bracket-less named-struct instance"
case `summarize_data_readability`'s docstring calls out explicitly
(`q-metric-singleton-struct-gap`): it contributes to
`named_struct_bytes` but **not** to `typed_array_bytes`, since there's
no array declaration on the instance symbol itself. This is the first
wave in this series to land bytes exclusively in `named_struct_bytes`
rather than `typed_array_bytes` — every prior wave's opaque
`unsigned char[N]` recipe is, by construction, an array declaration.

## Part 4 — the call-graph effect, measured

The kickoff asked whether carving these tables to real source lets
`analyze_symbols.build_call_graph` attribute readers it previously
could not. Measured directly rather than assumed, on the canary's own
pointee (`data_020c7920`) via `rank_data_symbols(...,
include_data_readers=True)`:

| | reader_count | data_reader_count | total | cross_module_readers |
|---|---:|---:|---:|---:|
| **Before** carving `data_020c7954` | 0 | 1 | 1 | 1 |
| **After** carving `data_020c7954` | 0 | 1 | 1 | 1 |

**Honest finding: no change.** The edge `build_call_graph` already saw
before this wave touched a single file is byte-identical to the edge
it sees after all 167 records are carved and `complete`.

`edges_load_from_data` (the wave-10 extension this kickoff's framing
refers to) is derived purely from `relocs.txt` + `symbols.txt` —
ROM-level facts that exist identically whether the enclosing byte
range is currently a `.c` TU or an unclaimed gap. The relocation from
`data_020c7954` to `data_020c7920` was already visible to the extended
call graph *before* this wave touched a single file, because
`enclosing_data_symbol`'s size lookup (`build_size_table`'s
next-symbol-gap deduction) doesn't require the enclosing symbol to be
carved — only for `symbols.txt` to know it exists and roughly how big
it is, which it already did. So the call-graph *edges* don't change.

**What does change**: `data_020c7954` itself moves from "open,
zero-reader-visible-only-via-data-edges" to `matched` — it drops out
of `rank_data_symbols`' worklist entirely (the metric every wave in
this series has used to size its own remaining pool), and the
relationship it encodes is now visible to a human reading `src/`, not
only to a tool that already knew to look in `relocs.txt`. The
"hole in the graph" this wave was scoped to close is a
source-legibility hole, not a `build_call_graph`-edges hole — worth
stating precisely so a future wave doesn't re-measure the same thing
expecting a different tool-output delta.

## What's parked (diagnosed, not attempted)

- **380 other single-pointer D-3 records** (every (size, offset)
  combination except (12, +8)) — same recipe, different byte layouts;
  natural next slice within this same sub-shape, deliberately not
  batched with this wave's uniform (12, +8) tranche.
- **873 multi-pointer D-3 records** (2+ internal relocations) — need a
  per-field struct layout inferred per candidate, materially harder
  than the single-pointer case; this wave's own D-1-signature census
  (zero all-pointer tables) means there's no shortcut available for
  these either.
- **1 self-referencing (12, +8) record** — legal C (`&self` inside its
  own initializer) but a different recipe shape; not worth a
  special-case for one 12-byte record.
- **4 non-4-aligned-size with-reloc candidates** — need Pattern 2/3
  composition, which this campaign has separately proven unreliable
  for `char[N]` (wave 11/12); untested for struct-shaped compositions
  specifically, flagged rather than assumed either way.

## Cross-references

- [`cluster-d-recipe.md`](../cluster-d-recipe.md) — the original D-1/
  D-2/D-3 sub-cluster taxonomy; this wave empirically confirms D-1 is
  exhausted and D-3 is what remains, and ships D-3's simplest case.
- [`cluster-b-pointer-pool.md`](../cluster-b-pointer-pool.md) — the
  settled `extern char X; void *Y = &X;` recipe this wave generalises
  from a standalone slot to a multi-field record.
- [`cm-restock-carve-13-2026-08-24.md`](cm-restock-carve-13-2026-08-24.md) —
  reported the embedded-pointer finding this wave investigates.
- [`cm-restock-carve-10-2026-08-22.md`](cm-restock-carve-10-2026-08-22.md) —
  the `edges_load_from_data` call-graph extension this wave's Part 4
  measures directly rather than assumes.
