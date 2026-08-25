[//]: # (markdownlint-disable MD013)

# cm-restock-carve-15 — the "unknown shape" mystery was a Windows path bug; EUR's ov002 `.bss` closes (141 symbols / 22,144 B) (2026-08-26)

Fifteenth wave of the `cm-restock-carve` series. The kickoff pointed at
`data_worklist.py --include-data-readers`'s top-ranked entries — heavily
read, `shape=unknown sec=unknown size=?` symbols in `ov002` — as "core
game data" that every prior wave passed over because `shape=unknown`
offered no recipe. **The real story is a tooling bug, not an
unclassifiable shape.**

## Part 0 — the classification wasn't wrong about the data; the tool was broken

`tools/data_worklist.py`'s `load_module_sections` derives each module's
short name (`main`, `ov002`, `itcm`, ...) from its `delinks.txt` path:

```python
rel = delinks_path.parent.relative_to(config_root)
rel_str = str(rel)
if rel_str == "arm9":
    module = "main"
elif rel_str.startswith("arm9/overlays/"):
    module = rel_str.split("/", 2)[-1]
elif rel_str.startswith("arm9/"):
    module = rel_str.split("/", 1)[-1]
```

`Path.relative_to(...)` joins with the **platform** separator.
`str(rel)` is `"arm9/overlays/ov002"` on POSIX but `"arm9\\overlays\\ov002"`
on Windows — so **neither `startswith` check has ever matched for a
single overlay/itcm/dtcm module on Windows**, this project's actual
build platform (`mwccarm.exe`/`mwldarm.exe` run natively, no runner —
`CLAUDE.md`). `modsecs_map` ended up keyed by the raw backslash path
string instead of the short name; every downstream lookup by short
name (`section_for_symbol`, `build_size_table`'s gap-deduction) missed
for every module except `main` (a single-path-component case that
happens to need no separator either way). The result: every overlay
and ITCM/DTCM data symbol's section degraded to `"unknown"`, its shape
to `SHAPE_UNKNOWN`, and its effective size — for any symbol declaring
`size=0` in `symbols.txt`, the normal case — to `0`.

**This had zero test coverage.** `grep -rn "load_module_sections" tests/`
returned nothing before this wave. CI's `unittest` job runs on
`ubuntu-latest` (POSIX), where `str(rel)` is forward-slash-joined and
the bug can never manifest — the exact "green in CI, silently wrong on
the platform that actually matters" pattern `configure-windows`
(brief 058) already exists to guard against for a different subsystem.

**Fix**: use `rel.parts` (an OS-independent tuple) instead of string
prefix matching:

```python
parts = rel.parts
if parts == ("arm9",):
    module = "main"
elif len(parts) >= 3 and parts[0] == "arm9" and parts[1] == "overlays":
    module = parts[2]
elif len(parts) >= 2 and parts[0] == "arm9":
    module = parts[1]
```

`tools/next_targets.py`'s `_module_name_from_delinks_path` already
used the correct `rel.parts`-based approach — `data_worklist.py`
implemented an independent, subtly different (and broken) version of
the same logic instead of reusing it. Two new regression tests
(`TestLoadModuleSections`) build a real multi-module config tree and
assert `modsecs_map` keys are short names, not raw paths; both fail
against the pre-fix code with the exact real-world symptom
(`'unknown' != 'bss'`) and pass after.

### Blast radius: bigger than shape display

`load_module_sections` also feeds `build_size_table`'s next-symbol-gap
size deduction (via `modsecs.section_of`) and, transitively,
`build_call_graph`'s `data_size_of` callback (`cm-restock-carve-10`'s
`edges_load_from_data` — the data→data attribution this whole
sub-campaign depends on). A `data(any)` overlay symbol with `size=0`
in `symbols.txt` (the normal case) always resolved to `effective_size=0`
before this fix, which made `ModuleData.enclosing_data_symbol`'s
`if size <= 0: return None` guard reject every candidate — **every
data→data edge SOURCED from inside an overlay-module data symbol has
been silently invisible to `edges_load_from_data` since
`cm-restock-carve-10`, for every overlay, not just `ov002`.**
`main`-sourced edges were never affected (module resolution for `main`
never depended on the broken prefix check).

Measured directly (`rank_data_symbols(..., min_readers=1,
include_data_readers=True)`, no module filter, before vs after the fix):

| | symbols | bytes |
|---|---:|---:|
| Before (as currently committed in `docs/dashboard.md`) | 5,321 | 187,760 |
| After (fix applied, no content change yet) | 8,230 | 429,350 |

+2,909 symbols / +241,590 bytes newly reachable — entries that only
cross the `min_readers≥1` threshold via a data-reader edge sourced
from an overlay, previously invisible. `module_filter="main"` alone is
unchanged (4,678 / 190,208 either way), confirming the delta is
entirely overlay-sourced. Concentrated in `ov000` (1,301), `ov004`
(864), `ov002` (457), `ov021` (156) — `ov002` is not even the largest
beneficiary of the fix; it's just where the kickoff's own top-reader
citation happened to land.

(The dashboard's own committed post-wave figure, after both this fix
*and* this wave's 141-symbol carve landing, is 8,099 / 407,506 — 141
fewer symbols / 22,144 fewer bytes than the fix-only snapshot above,
since those 141 are now `matched` and drop out of the reachable-pool
query entirely, per `docs/dashboard.md`'s own regeneration.)

## Part 1 — classifying the top ~20 by reader count (post-fix)

Re-ranked by raw `total_reader_count` (not the tool's default
cross-module-first sort, which the kickoff's own citation shows was
using reader count directly):

| module | symbol | readers | shape (post-fix) | size |
|---|---|---:|---|---:|
| ov002 | data_ov002_022cf16c | 1399 | **bss** | 4 |
| ov002 | data_ov002_022d016c | 660 | **bss** | 0xe4 |
| ov002 | data_ov002_022ce288 | 512 | **bss** | 0x300 |
| ov002 | data_ov002_022cf1a4 | 317 | **bss** | 2 |
| ov002 | data_ov002_022cf178 | 239 | **bss** | 4 |
| ov002 | data_ov002_022cf17c | 206 | **bss** | 4 |
| ov002 | data_ov002_022cd744 | 177 | **bss** | 0xc |
| ov002 | data_ov002_022cd3f4 | 160 | **bss** | 0x2c |
| main | data_020cdd30 | 154 | array | 0x2f0 |
| ov002 | data_ov002_022cf180 | 153 | **bss** | 4 |
| main | data_020dcfc0 | 138 | struct | 0x1de8 |
| main | data_020fb040 | 127 | array | 0x80 |
| ov002 | data_ov002_022cd73c | 126 | **bss** | 8 |
| ov002 | data_ov002_022d0e6c | 123 | **bss** | 4 |
| ov002 | data_ov002_022ce950 | 107 | **bss** | 8 |
| ov002 | data_ov002_022cf1ac | 106 | **bss** | 0xc0 |
| ov002 | data_ov002_022cf1a2 | 92 | **bss** | 2 |
| ov002 | data_ov002_022d0250 | 88 | **bss** | 2 |
| ov002 | data_ov002_022cd300 | 79 | **bss** | 0xa |
| ov002 | data_ov002_022d0650 | 74 | **bss** | 6 |

**18 of the top 20 are `.bss` in `ov002`.** The `readers=123` etc.
figures in the kickoff's own citation match this table exactly (once
`shape=unknown` is corrected to `shape=bss`) — confirming the fix, not
a different re-derivation.

**Access-width spot-check (the "care not speed" ask).** Disassembled
the ROM around a handful of `data_ov002_022cf16c`'s 1,402 raw load
sites (`build/eur/build/arm9_ov002.bin` via
`arm-none-eabi-objdump -D -b binary -m arm`). Reader shapes are
genuinely mixed and, for at least one site, non-trivial: one call
site computes `base + flag*stride + index*20`, then `ldrh [addr+54]`
— an indexed, possibly multi-region access pattern that does **not**
resolve to a single clean record layout from a handful of samples.
Another site does a simple `ldr r0,[r0,r7]` register-indexed word
load. **No single record layout could be confidently reverse-engineered
from this sample in the time available** — this is the finding the
kickoff explicitly permits reporting rather than forcing a guess.

**This doesn't block carving.** `.bss` is the one shape where content
fidelity is irrelevant to byte-identity: the ROM stores zero bytes for
`.bss` by definition (the loader zero-fills it at runtime), so a
correctly-**sized** declaration is byte-identical regardless of what
internal record layout the runtime eventually imposes on those bytes.
The no-invented-structure convention applies at full force here not as
a fallback but as the *correct* answer: `unsigned char`/`.space N`
either way produces identical ROM bytes.

## Part 2 — the recipe already exists; EUR was the one region missing it

This is not a new recipe. `docs/research/cluster-b-cross-region-bundle.md`
documents brief 169 (PR #605): **"Cluster A `.bss` mechanically applies
[cross-region] because `.bss` is zero-fill; no per-region content
needed."** That wave shipped `src/usa/overlay002/bss/data_ov002_bss.s`
and `src/jpn/overlay002/bss/data_ov002_bss.s` — one file per region,
141 symbols each, `.global`/`.space` per symbol, generated from each
region's own `symbols.txt` + section bounds. **`git log --all` on
`src/*/overlay002/bss/*` shows no EUR file has ever existed.** EUR's
ov002 `.bss` was simply never independently addressed — not because it
was harder, but because brief 169 was scoped to cross-region *porting*
of an existing EUR pattern, and no EUR-side wave had claimed this
module's `.bss` yet to port from. This wave closes that specific gap,
using the identical, already-proven, already-gated mechanism.

`tools/cross_region_cluster_apply.py` (brief 170's reusable
successor to 169's "implicit/ad-hoc" generator) covers cluster B/C/D-1/
D-2/D-3 but not cluster A `.bss` — brief 169's generator was never
promoted into that shared tool. This wave hand-writes the same output
shape brief 169 already established, rather than extending the CLI
(out of scope for a single-module gap-fill; flagged below for a future
tooling wave).

### Recipe (unchanged from brief 116/169)

```asm
        .bss

        .global data_ov002_022cd300
data_ov002_022cd300:
        .space 0xa
        .global data_ov002_022cd30a
data_ov002_022cd30a:
        .space 0x6
```

One `.global`/label/`.space` triplet per symbol, sized via
`build_size_table`'s next-symbol-gap deduction (now correct for
overlays post-fix). No relocations, no content bytes, no `const`/
`.rodata` concern (`.bss` has no read-only variant).

### Canary — gated alone before the full module

First 10 symbols by address (`data_ov002_022cd300` .. `data_ov002_022cd428`,
300 B), its own `delinks.txt` range, gated alone:

```
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
```

(pytest stage failed only on the 3 doc-staleness checks this diff
touches, as expected before regenerating — resolved below.) Canary's
`delinks.txt` entry reverted before generating the full module file,
so the final diff contains one clean 141-symbol claim, not a
canary-plus-remainder pair.

## Part 3 — the bounded tranche: all of EUR's ov002 `.bss`

**141 symbols exactly tile EUR's ov002 `.bss` section
(`0x022cd300`-`0x022d2980`, 22,144 B) with zero gaps and zero
already-named symbols** — confirmed by summing every symbol's
gap-deduced extent against the section's own declared bounds. This is
the whole class from Part 1, not a sample of it: every EUR ov002
`.bss` placeholder, one file (matching the exact USA/JPN convention),
141 `.global`/`.space` triplets.

Verification performed on all 141:

1. Zero gaps / zero overlaps: confirmed by tiling every symbol's
   gap-deduced extent end-to-end against the section boundary.
2. Zero already-named (non-`data_*`) symbols in the range.
3. `screen_names_against_src` over all 141 names: hits in
   `src/usa/overlay002/bss/data_ov002_bss.s` and
   `src/jpn/overlay002/bss/data_ov002_bss.s` for every name (the
   already-merged region ports) — zero conflicting EUR definitions.
4. Zero readers examined for content-fidelity risk, since `.bss`
   carries no content to get wrong.

Full 3-region clean gate (the complete 141-symbol module):

```
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
```

That run's `pytest` stage failed on 2 doc-staleness checks (dashboard,
research-index — both regenerated below; `state-table.md` and
`codegen-walls-index.md` were unaffected, no diff); a fresh
`pytest -q tests` run after regenerating is fully green:

```
3424 passed, 15 skipped, 76 subtests passed in 275.05s (0:04:35)
```

`git restore assets/` run after the clean gate.

## Named-struct / Typed-array, before → after

Measured via `tools/progress.py`'s `summarize_data_readability`,
BEFORE isolated via a real `git stash push -u` / `pop`:

| Metric | Before | After | Delta |
|---|---:|---:|---:|
| `typed_array_bytes` | `218,120` | `218,120` | **+0** |
| `named_struct_bytes` | `75,880` | `75,880` | **+0** |

**Zero delta, and correctly so.** `summarize_data_readability` only
scans `.c`/`.cpp` TUs (`if not (source.endswith(".c") or
source.endswith(".cpp")): continue`) — this wave's content, matching
brief 169's own established `.bss` convention exactly, is a single
`.s` file (`.global`/`.space` per symbol), not a C declaration. This
is the first wave in the series to ship real bytes that don't register
in either readability bucket at all, for a legitimate structural
reason rather than an oversight: `.bss` carries no content, and the
established cross-region-proven recipe for it is assembly, not C.
Progress here shows up in the dashboard's own `matched` /
reachable-pool figures (Part 0/3), not in the typed-declaration
metric.

## What this fix unlocks (scoping only, not this wave's to execute)

- **+241,590 B / +2,909 symbols** of newly-reachable, reader-attributed
  data across all overlays, per Part 0's measurement — the true size
  of the population every future `cm-restock-carve` wave should now
  re-derive from, not the stale 187,760 B figure.
- **ov000's 1,301 newly-visible entries** and **ov004's 864** are each
  larger than `ov002`'s 457 — natural next targets for a
  classify-then-recipe wave in this same style.
- **Promoting brief 169's cluster-A `.bss` generator into
  `cross_region_cluster_apply.py`** (or a small standalone tool) so
  future `.bss` gap-fills don't need a hand-written one-off script —
  flagged, not attempted this wave (single-module scope).
- The complex indexed access pattern found on `data_ov002_022cf16c`
  (Part 1) is a real, unresolved structural question about what that
  table actually is semantically — orthogonal to this wave's
  byte-identical `.bss` carve, worth a dedicated investigation if a
  future wave wants to *type* rather than just *place* it.

## Cross-references

- [`cluster-b-cross-region-bundle.md`](../cluster-b-cross-region-bundle.md) —
  brief 169's cluster-A `.bss` cross-region apply (the recipe this
  wave completes for EUR).
- [`cm-bss-carve-scope-2026-07-30.md`](cm-bss-carve-scope-2026-07-30.md) —
  the original `.bss` scoping note this campaign traces back to.
- [`cm-restock-carve-10-2026-08-22.md`](cm-restock-carve-10-2026-08-22.md) —
  `edges_load_from_data`, the mechanism Part 0 found silently broken
  for every overlay module since its introduction.
- [`src/usa/overlay002/bss/data_ov002_bss.s`](../../../src/usa/overlay002/bss/data_ov002_bss.s),
  [`src/jpn/overlay002/bss/data_ov002_bss.s`](../../../src/jpn/overlay002/bss/data_ov002_bss.s) —
  the already-merged region files this wave's EUR file matches exactly.
