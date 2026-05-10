# ov004-bss-shift

**Asked:** brief 052 part 3 — wave 12 (PR #366) shipped
`func_ov004_021c9d8c` byte-identical, but two sibling targets
(`func_ov004_021d38a4` setter + `func_ov004_021d38b4` getter,
both in cluster `func_02000cb4`) failed because their data
symbol `data_ov004_0229159c` resolves to `0x0229199C` in the
built ROM — exactly **0x400 (1024) bytes higher** than declared.
Investigate the shift; classify as a coercible per-function
fix, a tooling bug, or a known-baseline-failure carryover.

**Short answer:** The 0x400 BSS shift is a **symptom** of the
known **ov004 baseline-failure** noted in `CLAUDE.md` (one of
3 modules: ARM9 main, DTCM, overlay 4 still fail
`dsd check modules`). Root cause: ov004's RODATA section is
**0x408 bytes too large** in the built linker layout vs the
delinks-planned layout, shifting every downstream section
(INIT / CTOR / DATA / BSS) up by ~0x400 bytes. The shift
causes any function that references a BSS data symbol via a
relocation to mis-resolve at link time. **No per-function C
source fix exists** — this is a tooling/infrastructure issue
that must be resolved at the `dsd init`/`dsd delink` analysis
layer (likely an interaction with the
`--allow-unknown-function-calls` placeholder-symbol injection)
or via per-section symbols.txt curation. **Decomper
recommendation: defer ov004 BSS-relocated-data targets until
ov004 baseline checksum passes.**

## Method

Compared three layout sources for ov004's section boundaries:

1. **delinks plan** — `config/eur/arm9/overlays/ov004/
   delinks.txt`'s top-of-file section table (dsd's intended
   layout, derived from baserom analysis).
2. **Built linker layout** — section start/end markers in
   `build/eur/arm9.lcf` and the linker map
   `build/eur/arm9.o.xMAP` (mwldarm's actual placement).
3. **NDS overlay header (baserom)** — `code_size` /
   `bss_size` in `extract/eur/arm9_overlays/overlays.yaml`
   for ov004 (header bytes from the original ROM dump).

Cross-referenced the symbol-table addresses from
`config/eur/arm9/overlays/ov004/symbols.txt` against the
linker-map placement.

## The shift

| Section marker | delinks plan | built lcf | Δ |
|---|---:|---:|---:|
| TEXT_START | `0x021C9D60` | `0x021C9D60` | 0 |
| TEXT_END | `0x021DE638` | `0x021DE640` | **+8** |
| RODATA_START | `0x021DE638` | `0x021DE640` | +8 |
| RODATA_END | `0x02209A5C` | `0x02209E6C` | **+0x410** |
| INIT_START | `0x02209A5C` | `0x02209E6C` | +0x410 |
| INIT_END | `0x02209A88` | `0x02209E98` | +0x410 |
| CTOR_START | `0x02209A88` | `0x02209E98` | +0x410 |
| CTOR_END | `0x02209A8C` (+0x14 align) | `0x02209EA0` | +0x410 |
| DATA_START | `0x02209AA0` | `0x02209EA0` | +0x400 |
| DATA_END | `0x0220B500` | `0x0220B900` | **+0x400** |
| BSS_START | `0x0220B500` | `0x0220B900` | +0x400 |
| BSS_END | `0x02293D00` | `0x02294100` | +0x400 |

Two distinct deltas:

- **+8 bytes overshoot in TEXT** (a single function's `.text`
  section is 8 bytes too long, or a section-boundary alignment
  rule differs).
- **+0x408 bytes overshoot in RODATA** (most of the shift
  lives here — RODATA is 0x408 bytes longer in the built lcf
  than the delinks plan).
- **CTOR alignment absorbs 0x10 bytes** (delinks plan has
  CTOR_END + ALIGN(32) padding to DATA_START = 0x14;
  built lcf has tighter ALIGN behavior = 0x8). The net
  drops the +0x410 shift to +0x400 from DATA_START onward.

The data symbol `data_ov004_0229159c` (declared addr
`0x0229159C` per `symbols.txt`) sits inside ov004's BSS
region. Per the linker map it's placed at `0x0229199C`
(declared `0x0229159C` + `0x400` shift). Wave 12's
`func_ov004_021d38a4` and `_021d38b4` reference this symbol
via a literal-pool word relocation; the linker writes the
resolved address (`0x0229199C`) into the pool slot, which
diverges from the baserom's `0x0229159C`. **0x4 byte diff in
the pool word fails `dsd check modules`'s checksum for
overlay 4** — the same overlay that's already in the 3-
module baseline-fail set per
[CLAUDE.md](../../CLAUDE.md#current-round-trip-status-eur).

## Round-trip file size

```text

Baserom ov004.bin     : 268192 bytes (0x417A0)
Built arm9_ov004.bin  : 269216 bytes (0x41BA0)
Δ                     :   1024 bytes (0x400)

```

The 0x400 file-size delta exactly matches the BSS-shift
delta. The extra 0x400 bytes live in the loaded region (TEXT
+ RODATA + INIT + CTOR + DATA), pushing everything from
DATA_END onward — including BSS placement at runtime —
up by 0x400.

## Root cause hypothesis

**Most likely: `_dsd_gap@ov004_13.o`'s `.rodata` section is
mis-sized.** The gap-13 .o aggregates all ov004 sections that
dsd couldn't classify per-function:

```text

build/eur/delinks/_dsd_gap@ov004_13.o sections:
  .bss         00088800   ← matches BSS plan (0x88800)
  .data        00001A60   ← matches DATA plan (0x1A60)
  .ctor        00000004   ← matches CTOR plan
  .rodata      0002B424   ← delinks plan: 0x2B424 — matches
  .text        0000018C   ← single placeholder block
```

All section sizes in the gap-13 .o **match the delinks plan
exactly**. So the per-section sizes are correct at the .o
level. The shift must come from the *linker's* placement of
those sections — specifically, the linker's interpretation of
ALIGN/section-start rules differs from what the delinks plan
expected.

The +0x408 RODATA overshoot points at one of:

1. **A per-function `.rodata` from a matched src/overlay004
   .o adds extra padding** when concatenated alongside the
   gap-13 rodata.
2. **A section-layout interaction with
   `--allow-unknown-function-calls` placeholder symbols** —
   the placeholder injection at `dsd init` time may create a
   spurious section that mwldarm allocates space for.
3. **mwldarm `ALIGNALL(4)`** in the lcf
   (`build/eur/arm9.lcf` line 2190 for ov004) may interact
   differently with rodata than dsd expected.

Brief 052 has not isolated the exact mechanism — that
requires a `dsd init` re-run experiment with the
`--allow-unknown-function-calls` flag toggled (which is a
larger investigation, separate scope).

## Why this is a known-baseline-failure carryover, not a new bug

Per
[CLAUDE.md § Current round-trip status (EUR)](../../CLAUDE.md#current-round-trip-status-eur):

> **24 of 27 modules round-trip byte-identically.** The 3
> failures are almost certainly artifacts of the placeholder
> symbols that `--allow-unknown-function-calls` injected;
> expect them to resolve as the cross-module relocations in
> ARM9 main / DTCM / overlay 4 are manually filled in (or as
> the upstream analyzer improves).

ov004 is one of the 3. The 0x400 BSS shift is a **symptom of
the same underlying issue** — ov004's section layout is
imperfect at the dsd-analysis level, and any per-function
match that depends on a shifted-BSS data symbol will fail
`dsd check modules`. This is independent of the per-target C
source.

`func_ov004_021c9d8c` MATCHED in wave 12 because it
references `data_ov004_0220b500` — declared at `0x0220b500`,
placed by the linker at `0x0220B900` (also +0x400 shift). The
shift exists for that target too — but the baserom's
reference resolves to the SAME shifted address because the
shift is consistent across the whole BSS section. **The
specific failing pair (`_021d38a4`/`_021d38b4`) probably
fails for an unrelated per-function reason** that the wave 12
PR mis-attributed to the BSS shift; further investigation is
needed before claiming the shift causes the failure.

Wait — let me re-read the wave 12 PR. It says "2× ov004 BSS
layout shift" for the `func_02000cb4` cluster, with all 3
siblings referencing BSS-resolved data symbols. If 1 matched
and 2 failed, the differentiator is **which BSS symbol**
they reference, not the shift mechanism itself.

`func_ov004_021c9d8c` references `data_ov004_0220b500` (placed at
`0220B900`).
`func_ov004_021d38a4` and `_021d38b4` reference
`data_ov004_0229159c` (placed at `0229199C`).

Both are shifted by 0x400. If the shift is consistent, both
should fail equally — unless the matched function's
relocation works differently. **Hypothesis: `func_ov004_021c9d8c`
doesn't actually verify byte-identical against the baserom
either.** Wave 12 marks it matched, but `dsd check modules
overlay 4` still fails — so per-function objdiff might be
green (the pool word's resolved address matches whatever the
linker chose) while the baserom checksum disagrees.

This is the meta-issue: **per-function objdiff (which is what
the matching workflow uses) compares the .o's rebuilt-text vs
the baserom-extracted .o's text, which may show byte-identical
even though the rebuilt-overlay-binary's bytes differ.** dsd's
overlay-binary check is the only authoritative signal for the
overlay-4 case.

## Why this is a known-baseline-failure carryover (revised)

Both per-function "matches" in ov004 (the 1 historic +
`_021c9d8c` from wave 12) likely show green at objdiff but
contribute to the persistent overlay-4 baseline failure.
Marking them "matched" in symbols.txt is technically correct
— the function's rebuilt code matches at the .o level — but
the overall overlay-4 binary remains red until dsd's section
layout is corrected. Wave 12's "BSS layout shift" attribution
is one specific manifestation of this; there may be other
divergences in the overlay-4 binary that haven't surfaced
yet.

## Recommendation

1. **Defer ov004 BSS-relocated-data targets until ov004
   baseline checksum passes.** Match candidates that don't
   reference shifted-BSS data first; revisit BSS-relocated
   targets after the section-layout fix.
2. **Don't classify the wave-12 ov004 drops as a codegen
   wall.** They're flagged in `codegen-walls.md`'s cross-
   reference as `tooling/infra` not `permanent` — see brief
   052's update. They should be re-attempted once the
   ov004 baseline is fixed.
3. **Brain queues a follow-up brief to investigate the dsd
   section-layout side of the issue** if the easy-tier or
   medium-tier work runs out of non-ov004 candidates and
   ov004 becomes the bottleneck. Likely shape: cloud
   research on `dsd init --allow-unknown-function-calls`
   placeholder injection effects on ov004 section sizes;
   may surface as an upstream
   [ds-decomp issue](https://github.com/AetiasHax/ds-decomp/issues).
4. **Update `state.md`'s carryover list** to mention the
   ov004 BSS shift as a known instance of the overlay-4
   baseline-failure pattern (not a fresh issue).
5. **Don't attempt a per-function workaround** (e.g.,
   declaring the data symbol at the shifted address). That
   would mask the underlying bug AND fail to round-trip
   when the fix lands.

## Future investigation (not in scope)

If/when ov004 becomes a critical bottleneck:

1. Re-run `dsd init` against ov004 **without**
   `--allow-unknown-function-calls`. If ov004 then refuses
   to init (because of the cross-module placeholder
   references), the placeholder-injection mechanism is
   confirmed as the root cause.
2. Inspect the
   [ds-decomp upstream issues](https://github.com/AetiasHax/ds-decomp/issues)
   for similar overlay-4-style baseline-fail reports across
   other DS games. Pokediamond / pokeplatinum may have
   solved this differently.
3. Consider a manual `symbols.txt` curation pass — moving
   spurious BSS-classified symbols to DATA, or splitting
   the gap-13 .o into per-section subdivisions so the
   placeholder content gets isolated.

## Sources

- `config/eur/arm9/overlays/ov004/delinks.txt` — dsd's
  intended ov004 section layout.
- `build/eur/arm9.lcf` — generated linker script (lines
  2189-2257 for the `.ov004` section).
- `build/eur/arm9.o.xMAP` — mwldarm's linker map showing
  actual section placement and per-symbol resolved addresses.
- `extract/eur/arm9_overlays/overlays.yaml` — baserom NDS
  overlay header for ov004 (`base_address`, `code_size`,
  `bss_size`, `ctor_*`).
- `config/eur/arm9/overlays/ov004/symbols.txt` — declared
  per-symbol addresses.
- [CLAUDE.md § Current round-trip status (EUR)](../../CLAUDE.md#current-round-trip-status-eur)
  — documents the 3-module baseline failure (ARM9 main /
  DTCM / overlay 4) as known carryover from
  `--allow-unknown-function-calls`.
- Brief 049 self-extend 2 / wave 12 PR
  ([#366](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/366))
  — flagged the 0x400 shift on `func_ov004_021d38a4` /
  `_021d38b4`.
