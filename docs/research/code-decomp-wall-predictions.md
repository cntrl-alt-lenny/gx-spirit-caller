# First-wave wall predictions — brief 187 queue audit

**Brief:** 189 Part 1 (scaffolder). Audits the 40 easy + medium-easy
picks from
[`docs/research/code-decomp-resumption-queue.md`](code-decomp-resumption-queue.md)
against the recognition cues in
[`docs/research/codegen-walls.md`](codegen-walls.md). Skips the
12 trivial picks (brief 188 is shipping those — too small for
walls to matter).

## Methodology

Disassemble each pick via `arm-none-eabi-objdump -D -b binary
-m armv5te` against `extract/eur/<module>.bin`, then apply the
brief 189 regex classifier in `tools/predict_walls.py` to detect
recognition cues. The classifier covers the **regex-detectable
subset** of the wall taxonomy:

- **StyleA** — `bx lr` epilogue separate from `ldmfd sp!, {...}`.
- **C-1** — 3+ consecutive predicated-execution instructions.
- **C-12** — prologue pushes `r0` (arg-preserving thunk).
- **C-15** — constant-pair derivation (`mov rN, #K; mvn rM, #0`
  OR `mov rN, #K; sub rM, rN, #1`).
- **C-22** — 2+ adjacent `bic; orr` pairs.
- **C-23** — 3+ pc-relative loads + MMIO literal (`0x04000xxx`).
- **C-24** — `ldr rN, [pool]; bx rN` indirect dispatch.
- **P-9** — conditional `mvn{cond}`.

Walls requiring source-level context (C-2 local-pointer reuse,
C-9 saturating-cap predicate, C-17 bitfield mask redundancy,
C-25 / C-28 / S-1 / S-2) are out of regex-classifier scope —
the decomper should consult `codegen-walls.md` directly when
the predictor reports no wall but the asm is non-trivial.

## Queue tally

40 picks audited. Wall predictions:

| Wall | Picks | % of queue | Routing |
|---|---:|---:|---|
| **C-1** (predicated execution chain) | 10 | 25 % | `.c` (default) — but high false-positive rate, see § *C-1 caveat* below |
| **StyleA** (Style A epilogue) | 8 | 20 % | `.legacy.c` (mwcc 1.2/sp2p3) |
| **C-15** (flat-thunk arg setup constant pair) | 2 | 5 % | `.legacy.c` (mwcc 1.2/sp2p3) |
| **C-22** (adjacent bitfield writes) | 1 | 2.5 % | `.c` (default) — declare each window as separate bitfield |

22 picks (55 %) hit at least one wall; 18 picks (45 %) had no wall
predicted by the classifier — those are the safest starting
points for brief 190+'s code-decomp wave.

## Top 3 walls

Per the tally, brief 189 Part 2 produces focused research notes
for:

1. **StyleA** — [`first-wave-wall-style-a.md`](first-wave-wall-style-a.md)
   (highest-confidence detection; ~21 % of the entire project's
   functions per `predict_walls.py --version eur`)
2. **C-1** — [`first-wave-wall-c1.md`](first-wave-wall-c1.md)
   (predicated execution; common but high false-positive rate)
3. **C-15** — [`first-wave-wall-c15.md`](first-wave-wall-c15.md)
   (flat-thunk constant-pair derivation; same `.legacy.c`
   routing family as StyleA)

The 4th wall (C-22) appears only once in the queue but its
existing entry in
[`docs/research/codegen-walls.md`](codegen-walls.md#c-22) is
already thorough; brief 189 doesn't add a sibling note.

## C-1 caveat — read this before the decomper picks

The C-1 classifier flags **any** function with 3+ consecutive
predicated instructions. ARM idiomatically uses predicated
execution for short conditional bodies (e.g. `cmp r0, #0;
moveq r0, #1; bne return`), and not every such chain is a
fused-early-return that mwcc 2.0 will diverge from the orig on.

For the queue's 10 C-1 hits:

- **Definite C-1**: chains of 4+ predicated ops with mixed
  conditions (e.g. `hi`/`ls`/`gt`/`lt` mixing on the same
  flag-set) typically indicate a fused chain.
- **False positive**: 3-op chains with a single condition
  (e.g. `moveq`/`moveq`/`moveq` selecting one of several
  small values) are normal ARM patterns mwcc 2.0 emits
  correctly.

The C-1 wall research note enumerates both subclasses with
worked examples. When in doubt, **try the default routing first
and only escape to the recipe in [`docs/research/codegen-walls.md`](codegen-walls.md#c-1)
if objdiff shows a divergence**. Don't burn iterations on the
C-1 recipe pre-emptively.

## How to consume this audit

For each pick in the queue, look up its wall predictions here
or in `build/eur/analysis/wall_predictions.json` (regenerate via
`python tools/predict_walls.py --version eur`).

If the picks's row says **none predicted**: take the default
`.c` routing path. The classifier is conservative — if it
detected nothing, the function is likely a straightforward
match.

If the row says **StyleA** / **C-15** / **C-24**: rename the
file to `.legacy.c` (or `.legacy_sp3.c` for C-24) BEFORE writing
C source. Saves an iteration cycle.

If the row says **C-22**: declare each bitfield window as its
own struct member; don't use compound mask expressions.

If the row says **C-1**: write the default-routing C first; the
classifier's C-1 detection has a high false-positive rate (see
§ *C-1 caveat* above). Only consult the C-1 recipe if objdiff
shows a divergence.

## Per-pick wall predictions

### Easy (≤ 0x60) — 25 picks

| # | Module | Addr | Size | Walls predicted |
|---|--------|------|-----:|-----------------|
| 1 | `ov013` | `0x021c9d60` | `0x14` | none predicted |
| 2 | `ov012` | `0x021c9d8c` | `0x14` | none predicted |
| 3 | `ov004` | `0x021d3dc8` | `0x14` | none predicted |
| 4 | `ov011` | `0x021ca0ac` | `0x18` | none predicted |
| 5 | `ov004` | `0x021cb278` | `0x18` | none predicted |
| 6 | `ov004` | `0x021dbddc` | `0x18` | **C-1** |
| 7 | `ov004` | `0x021dbe40` | `0x1a` | **C-1** |
| 8 | `main` | `0x0205da2c` | `0x1c` | none predicted |
| 9 | `ov004` | `0x021cdd1c` | `0x1c` | none predicted |
| 10 | `ov004` | `0x021cfb84` | `0x1c` | none predicted |
| 11 | `ov002` | `0x02211808` | `0x1c` | none predicted |
| 12 | `main` | `0x02095108` | `0x28` | **StyleA** |
| 13 | `main` | `0x02095130` | `0x28` | **StyleA** |
| 14 | `main` | `0x020951a8` | `0x28` | **StyleA** |
| 15 | `ov011` | `0x021d2c64` | `0x28` | none predicted |
| 16 | `main` | `0x02094d18` | `0x34` | **StyleA** |
| 17 | `main` | `0x0201904c` | `0x3c` | **C-1** |
| 18 | `itcm` | `0x01ff8770` | `0x50` | **StyleA** |
| 19 | `main` | `0x020323f4` | `0x58` | none predicted |
| 20 | `ov011` | `0x021ca03c` | `0x58` | none predicted |
| 21 | `main` | `0x02001d0c` | `0x5c` | **C-22** |
| 22 | `main` | `0x0200b0c8` | `0x5c` | none predicted |
| 23 | `main` | `0x0201a32c` | `0x5c` | **C-1** |
| 24 | `ov011` | `0x021d2ca8` | `0x5c` | none predicted |
| 25 | `main` | `0x0207391c` | `0x60` | **C-1** |

### Medium-easy (≤ 0x100) — 15 picks

| # | Module | Addr | Size | Walls predicted |
|---|--------|------|-----:|-----------------|
| 1 | `main` | `0x0207dbf8` | `0x64` | none predicted |
| 2 | `main` | `0x0200b2f4` | `0x68` | **C-15** |
| 3 | `main` | `0x0203d078` | `0x68` | **C-1** |
| 4 | `main` | `0x0207db8c` | `0x6c` | **C-1** |
| 5 | `main` | `0x02096434` | `0x6c` | **StyleA** |
| 6 | `main` | `0x0200ed48` | `0x70` | none predicted |
| 7 | `main` | `0x02023f7c` | `0x70` | none predicted |
| 8 | `main` | `0x02026fd8` | `0x70` | none predicted |
| 9 | `main` | `0x02093dc8` | `0x70` | **StyleA** |
| 10 | `itcm` | `0x01ff86fc` | `0x74` | **StyleA**, **C-1** |
| 11 | `main` | `0x02021b38` | `0x74` | **C-15**, **C-1** |
| 12 | `main` | `0x02024574` | `0x74` | none predicted |
| 13 | `main` | `0x020270d0` | `0x74` | none predicted |
| 14 | `main` | `0x02028790` | `0x74` | none predicted |
| 15 | `main` | `0x020904d4` | `0x9c` | **C-1** |

## See also

- [`docs/research/codegen-walls.md`](codegen-walls.md) — the full
  wall taxonomy.
- [`docs/research/code-decomp-resumption-queue.md`](code-decomp-resumption-queue.md)
  — the 52-pick queue this brief audits.
- [`docs/research/first-wave-wall-style-a.md`](first-wave-wall-style-a.md)
  — brief 189 Part 2 § Style A epilogue recipe.
- [`docs/research/first-wave-wall-c1.md`](first-wave-wall-c1.md)
  — brief 189 Part 2 § C-1 predicated execution recipe.
- [`docs/research/first-wave-wall-c15.md`](first-wave-wall-c15.md)
  — brief 189 Part 2 § C-15 flat-thunk recipe.
- [`tools/predict_walls.py`](../../tools/predict_walls.py) —
  the disasm-based classifier (re-run after shipping matches to
  keep the predictions current).
- [`build/eur/analysis/wall_predictions.json`](../../build/eur/analysis/wall_predictions.json)
  — the project-wide wall-prediction database
  (gitignored under `build/`).
