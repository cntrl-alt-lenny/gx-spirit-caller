[//]: # (markdownlint-disable MD013)

# cm-restock-carve-10 — the call graph learns to see data->data edges; 739 more strings ship (2026-08-22)

Tenth wave of the `cm-restock-carve` series. Takes the successor
`cm-restock-carve-9`'s Part 2 scoped for itself: extend
`analyze_symbols.build_call_graph` to attribute a load reloc to its
enclosing DATA symbol (not only its enclosing function), then drain a
bounded first tranche of what that extension newly surfaces.

## The mechanism (confirmed in the source, not re-derived from prose)

`analyze_symbols.build_call_graph` resolved every load reloc's origin
with `caller = src_mod.enclosing_function(r.src_addr)`. A relocation
sourced from inside a data symbol — e.g. an uncarved pointer table
reading one of its own entries — has no enclosing *function*, so
`caller` was always `None` and the edge was dropped into
`graph.unresolved_loads`, never reaching `edges_load` (the field every
reader-count consumer, including `data_worklist.py`, actually reads).
Wave 9's Part 2 found this by hand for one table; this wave teaches the
tool to see it for every table at once.

## Tooling: `analyze_symbols.py` + `data_worklist.py`

**`ModuleData.enclosing_data_symbol(addr, size_of)`** — mirrors
`enclosing_function`'s bisect lookup but for `data`/`bss` symbols,
taking a `size_of` callback because most `data(any)` symbols declare
`size=0` in `symbols.txt` (the true extent is only known via
`data_worklist.build_size_table`'s next-symbol-gap deduction).

**`build_call_graph(modules, data_size_of=None)`** — new optional
parameter, default `None`. When a load reloc's source doesn't resolve
to a function AND `data_size_of` is provided, it's additionally
checked against `enclosing_data_symbol`; a resolved data->data edge
lands in a **new** `graph.edges_load_from_data` field, kept separate
from `edges_load`. Passing `None` (every one of the 16 real call sites
in `tools/` today) reproduces the prior behaviour with **no code path
change at all** — verified by grepping every `build_call_graph(...)`
call site in the repo; all 16 pass exactly one positional argument, so
none are affected. `edges_load`, `unresolved_calls`, and
`unresolved_loads` are byte-identical to before for every existing
caller.

**`data_worklist.py`**:

- `_load_readers_index_from_data` — the same inversion
  `_load_readers_index` does, over the new `edges_load_from_data`
  field.
- `DataEntry.data_reader_count` / `data_reader_modules` (default
  `0`/`frozenset()`) and a `total_reader_count` property
  (`reader_count + data_reader_count`). Sorting and
  `cross_module_readers` now key off the totals, which are provably
  identical to the old per-field values whenever `data_reader_count`
  is `0` — the unopted-in case.
- `rank_data_symbols(..., include_data_readers=False)` — opt-in. Off
  by default; `min_readers` filtering and every returned field are
  unchanged unless a caller passes `True`.
- `--include-data-readers` CLI flag, plus a "Data readers" column in
  `render_markdown`/`render_stdout_summary` that **only renders when
  the flag is set** (checked directly: default markdown output
  contains neither "Data readers" nor "include_data_readers").
- `screen_names_against_src(names, src_root)` — the mandatory
  precondition (see below), token-matched (word-boundary, not
  substring) against every `.c`/`.cpp`/`.h`/`.s` file under `src_root`.

30 new unit tests across both files (12 in `test_analyze_symbols.py`,
18 in `test_data_worklist.py`), all passing; full suite
(3334 tests total after this wave's additions) green, 15 pre-existing
skips unchanged.

## Fresh pool census (own measurement, not `cm-restock-carve-8`'s stale figure)

`cm-restock-carve-8` cited **~9,690 symbols / ~227,820 B** for the
"zero-reader" pool. That number has never been re-derived under the
extended graph, and waves 9/10 have both shipped work against it since
(697 symbols / 11,716 B). Re-derived fresh, `main`, unmatched
placeholder, function-reader count only:

| Query | Symbols | Bytes |
|---|---:|---:|
| unmatched placeholder data/bss, `main`, 0 function readers | 5,826 | 215,668 |

Extending the graph with `data_size_of` and re-running with
`include_data_readers=True`:

| Query | Symbols | Bytes |
|---|---:|---:|
| 0 function readers, **>=1 data reader** ("newly visible") | 5,751 | 213,220 |
| 0 function readers **and** 0 data readers (genuinely reader-less) | 75 | 2,448 |

**98.7% of the previously-"zero-reader" pool (5,751 of 5,826 symbols)
is pointed to by an uncarved or already-carved data table** — wave 9's
finding generalizes almost completely, not just to the 3,901-symbol
`shape=string` sample it checked by hand. Only 75 symbols / 2,448 B
remain genuinely unreferenced by either method; that residual is real
and small, not a rounding artifact of an incomplete extension.

Restricting to this wave's actual scope (`shape=string,string-ascii4`,
matching wave 9 Part 1's proven-safe recipe):

| Query | Symbols | Bytes |
|---|---:|---:|
| newly-visible, `string`/`string-ascii4` | 3,926 | 84,345 |
| … of which individually 4-aligned at both ends (Pattern 1, no TU composition) | **739** | **15,732** |

The remaining 3,187 string-shaped symbols (68,613 B) need Pattern
2/3-style composition (per-symbol size isn't 4-aligned) — out of this
wave's scope, flagged for a successor. The non-string shapes in the
newly-visible pool (`struct` 1,035/53,630 B, `array` 788/75,205 B,
`fnptr_table` 1/32 B, `jump_table` 1/8 B — 1,825 symbols / 128,875 B
total) need their own shape-specific carve recipes entirely, not
Pattern 1 — also out of scope. **This wave does not attempt the whole
pool; it attempts the bounded, zero-risk slice the extended graph and
wave 9's already-proven method cover together.**

## The mandatory src/ screen — run over the full 739, not skipped

Screened every one of the 739 candidate names against the **entire**
`src/` tree via the new `screen_names_against_src` (word-boundary
token match, not substring):

| | Count |
|---|---:|
| Hits (name referenced somewhere in `src/`) | 247 |
| … under a region-prefixed path only (`src/usa/`, `src/jpn/`) | 4 |
| … under an EUR-baseline path (`src/main/`) | 243 |

The 243 EUR-baseline hits are overwhelmingly `.extern`/`.word`
references from already-shipped `cluster_c_pattern3_gen.py` chunk
files — most concentrated in `data_020b46e0.s`, the **exact 18-entry
pointer table `cm-restock-carve-9`'s Attempt 1 broke against**. This
wave's candidate list includes several of the "14 more entries...not
traced further" that wave 9 explicitly flagged (e.g. `data_020c3cf4`,
this wave's canary). The 4 region-prefixed-only hits are `.s` files
under `src/usa/main/` and `src/jpn/main/` — confirmed via
`tools/configure.py`'s `_is_region_source_excluded` (`region !=
"eur"` excludes any non-region-prefixed `src/<module>/...` path from
non-EUR builds, and a region-prefixed path is *only* included for its
own region) that these can never co-compile with the EUR build this
wave targets; not a risk for this PR.

**Why none of the 247 blocked a carve**: `cm-restock-carve-9`'s
Attempt 1 broke specifically because it *omitted* 3 of 4 addresses
from their own declaration (absorbed into one un-named blob) while an
already-shipped file `.extern`'d those omitted names. This wave
composes **zero** TUs — every one of the 739 candidates gets its own
individual `char name[N] = "…";` declaration (Pattern 1, per
`cluster-c-recipe.md`), so no name is ever omitted from its own
declaration. A `.extern`/`.word` hit under this strategy is exactly
the evidence a real reader exists — it's what gets satisfied by the
new declaration, not what breaks. The screen still ran over the full
set (not skipped, not assumed) because the invariant it protects is a
precondition of the *strategy*, not of any one candidate, and a future
wave that composes TUs must not be able to skip it.

## Canary — gated alone before any batching

Picked `data_020c3cf4` (12 B, `.data`, content `"fw_r1212l"`) — one of
wave 9's own explicitly-flagged-but-untraced siblings of
`data_020b46e0`'s pointer table. Verified per-candidate (independently
of the shape classifier that selected it): zero outgoing relocations
from inside its own span; real bytes read from
`build/eur/build/arm9.bin` via `ModuleSections.bytes_at` (never
copied from a stale worklist); last byte zero and all padding after
the first NUL byte also zero; printable-ASCII content before the
terminator; individually 4-aligned at both ends; zero overlap against
every existing `delinks.txt` TU range (any status, not just
`complete` — the stronger check wave 9 used).

Shipped alone, gated alone:

```
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
==================== GATE PASS ====================
```

The data->data reader is a sufficient basis for the method — proceeded
to the full tranche.

## Result: 739 symbols shipped, 15,732 bytes

All 739 individually verified the same way as the canary (scripted,
not sampled): zero internal outgoing relocations; real bytes from
`arm9.bin`; last-byte-zero + all-zero padding after the first NUL;
printable-ASCII content; individually 4-aligned both ends; zero
overlap against any existing TU (any status). Zero candidates flagged
by any check. 100% `.data` section (none `.rodata` — the W6
`.rodata` 4-byte-rounding wall from `cluster-c-recipe.md` doesn't
apply to this batch at all). Zero candidates needed string-literal
escaping (no `\`, `"`, newline, or tab bytes in this batch's content).

Files: `src/main/data/data_<addr>.c`, one per symbol, each declaring
`char data_<addr>[N] = "…";` and documenting its resolved reader(s) —
either a named function (a handful still have real function readers
alongside their now-visible data reader) or the specific data pointer
table address, per-candidate, matching wave 9's per-file documentation
convention.

## Gate

Full 3-region clean-tree gate (`python tools/gate3.py --scope all
--clean`):

```
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
```

The same invocation's `pytest` stage failed on two pre-existing-as-of-
this-diff checks — `test_generate_state_table.py::TestCommittedTableIsCurrent`
and `test_generate_research_index.py::TestCommittedIndexIsCurrent` —
both purely doc-staleness (this wave adds a new research note and 739
new matched-adjacent source files; `docs/state-table.md` and
`docs/research/README.md` hadn't been regenerated yet). Not a
SHA1/build issue. Regenerated below (`generate_state_table.py`,
`generate_research_index.py`), then a fresh `pytest -q tests` run is
fully green:

```
3304 passed, 15 skipped, 72 subtests passed in 61.66s (0:01:01)
```

`git restore assets/` run after the `--clean` gate (it deletes the
heatmap SVGs as a side effect — known issue, see
`feedback_gate3-clean-deletes-heatmap-assets` in the brain's own
memory) so the heatmap assets stay out of this diff.

## Named-struct / Typed-array, before → after

Measured via `tools/progress.py`'s `summarize_data_readability`,
BEFORE isolated via an actual `git stash push -u` / `pop` (wave 9's
method, not recalled):

| Metric | Before | After | Delta |
|---|---:|---:|---:|
| `typed_array_bytes` | 194,228 | 209,960 | **+15,732** |
| `named_struct_bytes` | 73,876 | 73,876 | **+0** |

Every file this wave declares a plain `char name[N] = "…";` — a
primitive-typed array, never a named-struct typedef — so 100% of the
delta lands in `typed_array_bytes`, `0` in `named_struct_bytes`.
`15,732 = 12` (canary) `+ 15,720` (remaining 738), matching the byte
total shipped exactly.

## What this unlocks (scoping only, not this wave's to execute)

- **3,187 string-shaped symbols / 68,613 B** in `main` are now known,
  reader-verified, newly-visible candidates that fail only the
  individually-4-aligned check — the next wave's Pattern 2/3 target,
  with a pool size and byte total this wave derived fresh (not
  estimated).
- **1,825 non-string-shaped symbols / 128,875 B** (`struct`, `array`,
  `fnptr_table`, `jump_table`) are newly visible by the same
  mechanism but need shape-specific carve recipes this wave didn't
  attempt.
- **75 symbols / 2,448 B** remain genuinely reader-less by both
  methods — a real, small residual, not yet explained.
- The `--include-data-readers` flag and `screen_names_against_src`
  are durable, tested, general-purpose tooling now available to any
  future wave targeting this pool via any shape or recipe — not
  single-use scaffolding for this wave's 739.

## Cross-references

- [`cm-restock-carve-9-2026-08-17.md`](cm-restock-carve-9-2026-08-17.md) —
  the wave that found the mechanism by hand for one table and one
  absorbing retest, and hit the `.extern` failure mode this wave's
  screen formalizes.
- [`../cluster-c-recipe.md`](../cluster-c-recipe.md) — Pattern 1 (one
  symbol, one `.c` file, naturally 4-aligned), the recipe every one of
  this wave's 739 files follows.
- [`../codegen-walls.md`](../codegen-walls.md) — P-50, the
  composed-TU wall this wave avoids by construction (zero TU
  composition, n=1 everywhere).
