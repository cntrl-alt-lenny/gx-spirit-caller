# C-20 family corpus scan — propagation candidates after wave 22

_Generated 2026-05-12 by `cloud` after brain's post-#396 hand-off
flagged: "Wave 22 demonstrated that brief 056's recipe is drop-in
for halfword-pack triplets with no per-target tuning. Worth running
a survey across the corpus for the same wall family."_

> **⚠️ Brain please confirm scope.** The brief sketched an
> instruction-level grep of `extract/eur/**/*.s` for the literal
> `lsl rN, rN, #0x10 ; lsr rN, rN, #0x10 ; ... ; orr ..., lsr
> #0x10 ; bx ip` sequence. Cloud has no toolchain / baserom /
> dsd-extracted `.s` files, so this scan substitutes a
> **reloc-signature pre-filter** built on `tools/find_pattern_
> clusters.py` against `config/eur/**/{symbols,relocs,delinks}.txt`
> alone. Trade-off discussed in *Methodology*. Two outputs:
>
> 1. **HIGH-confidence (3 candidates).** Unmatched siblings sharing
>    the **exact** reloc signature with already-matched C-20-family
>    anchors. Drop-in via brief 056's recipe, no asm verification
>    required for the routing decision.
> 2. **MEDIUM-confidence (90 candidates across 20 clusters).** A
>    structural superset — small tail-call thunks (size 0x20-0x40,
>    one outgoing `load` reloc) — that includes the C-20-family
>    population but also plain `.c`-tractable thunks. Decomper
>    spot-checks each before routing.
>
> If brain wants the strict asm-grep version, that's a brain-host
> task (needs `dsd dis` against the baserom) — `tools/find_shape
> _templates.py` is the existing infrastructure for it. No
> decomper hand-off until brain has scoped which output to act on.

## Run provenance

- **Tool:** `tools/find_pattern_clusters.py` (size + reloc-kind
  fingerprint clustering; `--version eur` against latest main
  `23136fc`).
- **Anchor set:** the 4 already-matched C-20-shape thunks in the
  EUR corpus:

  | Function                  | Size | Tier route      | Wave   |
  |---------------------------|------|-----------------|--------|
  | `func_ov002_021ae60c`     | 0x2c | `*.legacy.c`    | 22 (#392) |
  | `func_ov002_021ae638`     | 0x2c | `*.legacy.c`    | 22 (#392) |
  | `func_ov002_021ae6a4`     | 0x2c | `*.legacy.c`    | 22 (#392) |
  | `func_ov002_02259a68`     | 0x2c | `.c` (C-16 W-H) | 20 (#387) |

  All four share `(size=0x2c, reloc_sig_len=1)` — the cluster
  `find_pattern_clusters.py` reports under each anchor.

- **Population scanned:** every cluster in the full EUR run with
  `0x20 ≤ size ≤ 0x40` AND `sig_len == 1` (single outgoing
  reloc — the thunk shape). 20 clusters, 90 unmatched candidates
  across them (47 main + 34 ov002 + 5 ov000 + 2 ov004 + 2 ov011).

## TL;DR

| Confidence | Candidates | Recommended action |
|---|---:|---|
| **HIGH (exact reloc-sig match with C-20 anchors)** | **3** | Decomper applies brief 056 recipe verbatim. Likely drop-in. |
| **MEDIUM (C-20-shape thunks; some plain `.c`, some C-20-family)** | **90** | Decomper triages with asm; route the C-20-pattern ones via `*.legacy.c`. |

## High-confidence candidates (3)

### Cluster A — exact C-20 halfword-pack triplet sig (size=0x2c, sig=1)

| Module | Address      | Symbol                       | Size | Outgoing load reloc target | Notes |
|--------|--------------|------------------------------|------|----------------------------|-------|
| main   | `0x0206eea0` | `func_0206eea0`              | 0x2c | `func_0206c9b0` (main, 0x9c)   | Cross-module: same shape as ov002 triplet but in main. |
| ov002  | `0x022a8668` | `func_ov002_022a8668`        | 0x2c | `func_02037208` (main, 0x44)   | Cross-module call (ov002 → main). |

Both share `(size=0x2c, sig=1)` with the 4 matched anchors above.
The single outgoing reloc is `kind:load`, target inside `.text`
of another module — exactly the `ldr ip, .L; bx ip` tail-call
shape that C-20 walls live in. **Drop-in via brief 056 recipe
through `*.legacy.c` routing.**

### Cluster B — byte-pack variant called out in codegen-walls C-20 (size=0x28, sig=1)

| Module | Address      | Symbol                       | Size | Outgoing load reloc target |
|--------|--------------|------------------------------|------|----------------------------|
| ov002  | `0x0226b00c` | `func_ov002_0226b00c`        | 0x28 | (single load, ov002-local) |

This is the family extension explicitly named in
[`codegen-walls.md` C-20](codegen-walls.md#c-20-pack-halfwords-into-arg--tail-call-via-legacy-tier-routing):

> **Family extension:** `func_ov002_0226b00c` is the same wall on
> a byte-pack variant (target masks `r3` / `r2` with `and #0xff`
> instead of `lsl/lsr`); the recipe shape needs adjusted source
> form but routing tier is the same (`*.legacy.c`). Decomper to
> verify per-target.

Cluster anchors (matched, plain `.c`): `func_ov002_022598ec`,
`func_ov002_02259a40`. Source forms documented in
[`src/overlay002/func_ov002_022598ec.c`](../../src/overlay002/func_ov002_022598ec.c)
— same `mov rN, lsl #N` / `orr rD, rS, rT, lsr #N` shape, just
not the redundant explicit `lsl K; lsr K` mask pair that triggers
the C-20 mwcc-2.0 elision. Decomper compares `0226b00c`'s asm
against both forms (matched-anchor's plain `.c` vs. routed
C-20 recipe) and picks whichever the byte-and-mask shape
demands.

## Medium-confidence candidate pool (20 clusters, 90 unmatched)

Every cluster below shares the structural fingerprint of a
small tail-call thunk: one outgoing `load` reloc (the `.L`
constant for `bx ip`), no internal branches in the reloc
table, size in the 0x20-0x40 band. **Not all are C-20-pattern
walls** — some will be plain-`.c`-tractable mwcc-2.0 emissions
like `func_ov002_022598ec`. Decomper spot-checks the asm to
decide routing per target.

Ranked by `unmatched` count desc, then by size asc. Anchors
listed are the matched representative the decomper can compare
each unmatched target's asm against.

| size | sig | matched | unmatched | anchor (matched representative)     | unmatched modules        |
|-----:|----:|--------:|----------:|--------------------------------------|--------------------------|
| 0x2c |   1 |       3 |       13  | `func_02023214` / `func_0202b0b4`    | main:8, ov000:1, ov002:2, ov004:1, ov011:1 |
| 0x30 |   1 |       5 |       12  | `func_02023214`                      | main:7, ov000:1, ov002:2, ov004:1, ov011:1 |
| 0x28 |   1 |      11 |       10  | `func_02038594`                      | main:7, ov000:1, ov002:2 |
| 0x30 |   1 |       1 |        7  | `func_ov006_021b8e1c`                | main:4, ov002:3          |
| 0x20 |   1 |       1 |        6  | `func_0200b208`                      | ov002:6                  |
| 0x24 |   1 |       1 |        6  | `func_0202e234`                      | main:2, ov002:4          |
| 0x30 |   1 |       1 |        5  | `func_0201b7fc`                      | main:5                   |
| 0x24 |   1 |      10 |        5  | `func_02018b70`                      | main:2, ov002:3          |
| 0x20 |   1 |      37 |        4  | `func_020071a4`                      | main:2, ov000:2          |
| 0x20 |   1 |       7 |        4  | `func_0201967c`                      | main:1, ov002:3          |
| 0x20 |   1 |       1 |        3  | `func_02018a64`                      | ov002:3                  |
| 0x20 |   1 |       1 |        3  | `func_020206b8`                      | ov002:3                  |
| 0x40 |   1 |       1 |        3  | `func_02031a70`                      | main:2, ov002:1          |
| 0x2c |   1 |       4 |        2  | **`func_ov002_021ae60c`** *(C-20 anchor — Cluster A above)*       | main:1, ov002:1          |
| 0x28 |   1 |       2 |        2  | `func_020196b0`                      | main:2                   |
| 0x28 |   1 |       2 |        1  | **`func_ov002_022598ec`** *(C-20 byte-pack anchor — Cluster B above)* | ov002:1                  |
| 0x2c |   1 |       1 |        1  | `func_02018a38`                      | main:1                   |
| 0x38 |   1 |       2 |        1  | `func_0201aabc`                      | main:1                   |
| 0x3c |   1 |       1 |        1  | `func_0200c558`                      | main:1                   |
| 0x3c |   1 |       1 |        1  | `func_02018d1c`                      | main:1                   |

**Per-module totals across the 0x20-0x40 sig=1 pool:**

| Module | Unmatched candidates |
|--------|---------------------:|
| main   | 47 |
| ov002  | 34 |
| ov000  | 5  |
| ov004  | 2  |
| ov011  | 2  |
| **Total** | **90** |

**Per-size totals:**

| Size  | Unmatched candidates |
|-------|---------------------:|
| 0x20  | 20 |
| 0x24  | 11 |
| 0x28  | 13 |
| 0x2c  | 16 |
| 0x30  | 24 |
| 0x38  | 1  |
| 0x3c  | 2  |
| 0x40  | 3  |
| **Total** | **90** |

## Methodology

### What this scan does

Static reloc-signature clustering via the existing
`tools/find_pattern_clusters.py`. For every function in
`config/eur/**/symbols.txt`, the tool computes a fingerprint
`(size, sorted_reloc_kinds_per_offset)` from
`config/eur/**/relocs.txt` and buckets by that key. Buckets
containing both matched and unmatched siblings are
"propagation-ready" — the matched member is a working template,
the unmatched siblings share enough shape that
`tools/propagate_template.py` can apply the template
mechanically once asm-confirmation is done.

For this scan we narrow the universe to *thunk-shaped* buckets:
`size ∈ [0x20, 0x40]` (C-20's known size 0x2c sits in the middle
of this band, with byte-pack variants down at 0x28 and 3-halfword
variants up at 0x30+) and `sig_len == 1` (a single outgoing
reloc — the constant-pool `load` for the `ldr ip, .L; bx ip`
tail-call). 422 unmatched candidates exist across all
propagation-ready clusters in the EUR corpus; 90 fall in this
thunk-shape band.

### What this scan does NOT do

The literal instruction-level grep brain sketched in the brief
is **not** runnable from cloud:

- No `extract/eur/` directory — that's `dsd rom extract`'s
  output, which needs a baserom dump.
- No `.s` files under `build/eur/delinks/` either — that's
  `dsd delink`'s output, same dependency.
- No `dsd dis` invocation possible — no `dsd` binary in the
  cloud environment, no baserom for it to read.

`tools/find_shape_templates.py` is the existing tool that
*does* perform opcode-sequence similarity over `dsd dis`
output (see its docstring + brief 023's
[`ov006-cluster-stuck.md`](ov006-cluster-stuck.md)) — that's
the right tool for the instruction-level scan, runnable on a
brain host. The doc's *Pipeline* step 1 (run `dsd dis` once
into a per-version cache directory) is exactly the dependency
cloud can't satisfy. If brain wants the literal asm-grep
output, it's a brain-environment task.

### Why the reloc-sig pre-filter still has signal

The reloc fingerprint at `(size, sig)` resolution is a
**necessary** condition for `propagate_template`'s exact-match
mechanic — every successful propagation in briefs 016 / 017 /
020 / 022 / 024 / 027 / 028 / 029 / 030 / 033 came from a
cluster where the matched anchor and unmatched target shared
exactly this fingerprint. So the **HIGH-confidence** rows
(2 + 1 = 3 candidates that share the fingerprint with already-
matched C-20-family anchors) are guaranteed structurally
compatible with the brief 056 recipe — the only remaining
question per-target is which routing tier the asm picks
(`*.legacy.c` for explicit-mask C-20 shapes vs. plain `.c`
for mwcc-2.0-friendly emissions like `func_ov002_022598ec`),
and that decision is the same per-recipe regardless.

It's **not sufficient** in the other direction: the broader
90-candidate pool includes thunk-shapes that don't pack
halfwords at all (e.g. simple `bx ip + .word` thunks with no
arg massaging). Decomper triages those with asm.

### Reproducibility

The exact commands cloud used:

```bash
python tools/find_pattern_clusters.py --version eur ov002 0x021ae60c
python tools/find_pattern_clusters.py --version eur ov002 0x021ae638
python tools/find_pattern_clusters.py --version eur ov002 0x021ae6a4
python tools/find_pattern_clusters.py --version eur --json > clusters.json
```

Then post-filtered the JSON for `0x20 ≤ size ≤ 0x40` and
`sig_len == 1` (the per-size and per-module tables above).
All inputs are version-controlled config text; no toolchain
state required. Runs in under a second on a stock Python 3.11
checkout of main.

## Recommended next move (pending brain's scope-confirm)

If the reloc-sig pre-filter approach is acceptable:

1. **Decomper drops in brief 056 recipe verbatim against the 3
   HIGH-confidence candidates** (`func_0206eea0`,
   `func_ov002_022a8668`, `func_ov002_0226b00c`).
   Expected outcome: 3 matches, ~80-120 bytes recovered (assuming
   the same `~0x2c`-byte size as the triplet, less for byte-pack
   variants). If any miss, the cluster-anchor's plain `.c` form
   is the fallback (especially for `0226b00c`'s byte-pack shape).

2. **Decomper triages the 90-candidate MEDIUM pool** as time
   permits, picking the C-20-pattern subset by asm inspection.
   Realistic yield (extrapolating from briefs 022-033's
   propagate-template waves): ~15-25% of the 90 cluster siblings
   turn into matches, weighted toward the higher-`matched_count`
   clusters where the template has already proven itself
   multiple times.

If brain wants the strict asm-grep version instead, that's a
brain-environment task — `tools/find_shape_templates.py` with
`--target main 0x0206eea0` (and analogous calls per candidate)
runs `dsd dis` once and ranks matched-set siblings by opcode-
sequence similarity. The current scan can serve as the input
filter (90 thunk-shape candidates → narrows the `find_shape_
templates` per-target search-space).

## Provenance

- Brief 056 origin (PR #389): research that established the C-20
  recipe, defined the wall, named the family extension at
  `func_ov002_0226b00c`.
- Wave 20 (PR #387): the original drop wave that flagged
  "pack-multiple-halfwords-into-a-single-arg" as a C-N candidate.
- Wave 22 (PR #392): first end-to-end validation — 3 byte-
  identical matches via brief 056 recipe verbatim, decomper's
  iteration note "C-20 recipe is 'drop-in copy-paste' for halfword-
  pack triplets — suggests scanning the rest of the corpus for the
  same wall family" motivated this survey.
- This scan (cloud autonomous, post-#396).
