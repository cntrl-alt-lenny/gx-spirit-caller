# EUR unknown-pool profile — 2026-07-22

Build-free census for queue item `q-unknown-pool-profile`. The committed
`python tools/wall_aware_headroom.py --json` scan found **5,945** live EUR
`.s` files in the `unknown` bucket: the files are still candidates, but the
tool has no citable `C-NN`/`P-NN` decision for them. This document records what
their headers and bodies actually say; it does not decide whether any file is
matchable.

## Headline

| Provenance in the leading header | Files | Share | Size bytes | Readable evidence |
|---|---:|---:|---:|---|
| `GLOBAL_ASM` / briefs 294+302 cohort | 5,928 | 99.71% | 0x1f85c8 | blanket whole-function / endgame stamp |
| Briefs 288/290 commutative-add wall prose | 17 | 0.29% | 0x0c24 | named per-function negative-result prose |
| **Total unknown pool** | **5,945** | **100%** | **0x1f91ec** | **5,943 function TUs + 2 named/data TUs** |

The apparently large unknown pool is therefore overwhelmingly one cohort
stamp, not a collection of 5,945 distinct provenance trails. `main` is the
important unresolved classification gap: all **2,370** of its unknown files
carry the blanket `GLOBAL_ASM` / brief-294/302 header. `overlay002` has 2,736
unknown files, of which 2,719 carry that stamp and 17 carry the more specific
288/290 prose.

## Header provenance by module

Every one of the 5,945 files was read and assigned from its leading comment
preamble. The module table makes the two cohorts and the concentration visible.

| Module | Unknown `.s` | GLOBAL_ASM / 294+302 | Brief 288/290 |
|---|---:|---:|---:|
| `main` | 2,370 | 2,370 | 0 |
| `overlay000` | 58 | 58 | 0 |
| `overlay001` | 1 | 1 | 0 |
| `overlay002` | 2,736 | 2,719 | 17 |
| `overlay003` | 18 | 18 | 0 |
| `overlay004` | 150 | 150 | 0 |
| `overlay005` | 32 | 32 | 0 |
| `overlay006` | 158 | 158 | 0 |
| `overlay007` | 10 | 10 | 0 |
| `overlay008` | 56 | 56 | 0 |
| `overlay009` | 17 | 17 | 0 |
| `overlay010` | 48 | 48 | 0 |
| `overlay011` | 70 | 70 | 0 |
| `overlay012` | 14 | 14 | 0 |
| `overlay013` | 8 | 8 | 0 |
| `overlay014` | 20 | 20 | 0 |
| `overlay015` | 26 | 26 | 0 |
| `overlay016` | 41 | 41 | 0 |
| `overlay017` | 29 | 29 | 0 |
| `overlay018` | 9 | 9 | 0 |
| `overlay019` | 25 | 25 | 0 |
| `overlay020` | 26 | 26 | 0 |
| `overlay021` | 9 | 9 | 0 |
| `overlay022` | 12 | 12 | 0 |
| `overlay023` | 2 | 2 | 0 |
| **Total** | **5,945** | **5,928** | **17** |

The blanket cohort header begins with the `GLOBAL_ASM` whole-function stamp
and frames the function as a brief-294/302 endgame carve. The 17 overlay002
exceptions carry the brief-290 “commutative add-operand order” / brief-288
CSE-wall wording instead. No third provenance class appeared in this scan.

## Size distribution

Sizes are the committed `.text` span for the source TU in the relevant EUR
`delinks.txt`; no object files or build products were read. Buckets match the
existing wall-marker census: `<=0x10`, `0x11–0x7f`, `0x80–0xff`, and `>=0x100`.

| Provenance | `<=0x10` | `0x11–0x7f` | `0x80–0xff` | `>=0x100` | Total bytes |
|---|---:|---:|---:|---:|---:|
| GLOBAL_ASM / 294+302 | 0 | 1,577 | 2,032 | 2,319 | 0x1f85c8 |
| Brief 288/290 | 0 | 0 | 17 | 0 | 0x0c24 |
| **Total** | **0** | **1,577** | **2,049** | **2,319** | **0x1f91ec** |

The unknown pool is not a short-stub pool: no file is at or below `0x10`,
1,577 are in the short-to-mid `0x11–0x7f` band, and 2,319 are at least
`0x100` bytes. The byte total is a census of the source spans, not a claim
that every byte is independently uncovered ROM content.

## Mechanical body-shape census

For function-shaped `.s` files, the source text was scanned for instruction
mnemonics, calls, and conditional/unconditional branches. The categories are
the same conservative labels used by the earlier no-marker census:

- `stub`: span `<=0x8`;
- `large`: span `>=0x100` (this takes precedence over other shape labels);
- `dispatcher`: at least four branch instructions;
- `leaf`: no calls and no branches;
- `branching/loop`: the remaining function bodies.

Two non-`func_` named/data TUs are reported separately rather than forced into
a function shape: `src/main/FS_LoadOverlayInfo.s` and
`src/main/FS_UnloadOverlay.s`. This is a source-text shape count only; it is
not a matchability score.

| Provenance | Stub | Leaf | Branching/loop | Dispatcher | Large | Named/data TU | Total |
|---|---:|---:|---:|---:|---:|---:|---:|
| GLOBAL_ASM / 294+302 | 0 | 109 | 2,766 | 733 | 2,318 | 2 | 5,928 |
| Brief 288/290 | 0 | 0 | 17 | 0 | 0 | 0 | 17 |
| **Total** | **0** | **109** | **2,783** | **733** | **2,318** | **2** | **5,945** |

The two non-function-shaped files are both in the blanket cohort; they are
kept in the total because `wall_aware_headroom.py` counts live `.s` TUs, but
they should not be interpreted as callable unknown functions. Among the 5,943
function-shaped files, 2,318 are large, 733 are branch-dense dispatchers, 109
are source-level leaves, and 2,783 are the remaining branching/loop class.

## Interpretation boundary

The census supports one narrow conclusion: the 5,945 tool-level unknowns are
not 5,945 independently documented unknowns. **5,928 are the same blanket
GLOBAL_ASM / brief-294/302 provenance class**, including all 2,370 `main`
files; **17** have a more specific 288/290 negative-result header. The header
stamp alone does not prove the brief-294/302 claim for each function, so this
report does not reclassify them as permanent walls or recommend retrying them.
That decision remains outside this mechanical queue item.

## Method and gate

- Source set: the `unknown_files` lists from the committed build-free
  `tools/wall_aware_headroom.py --json` scan, EUR `src/main` and
  `src/overlayNNN` only.
- Provenance: leading comment preamble, normalized into the two exact header
  families above; no full-body prose was used to invent a provenance label.
- Size: `.text` start/end span in committed `config/eur/**/delinks.txt`.
- Shape: source-assembly mnemonic scan with the explicit thresholds above.
- No build, compiler, disassembler, source, config, or tool input was changed.
