# first-wave wall — literal-tail trim trap (C-36)

**Investigation:** brief 208 (2026-05-25, scaffolder).
**Status:** classified + fixed + worked example shipped.
**Reproducible on:** every `.s` ship whose last pool word is
a small literal (top 2 bytes `0x00 0x00`) AND has no
relocation on the last 4 bytes.

## The problem in one paragraph

`tools/patch_section_align.py::trim_text_section_padding` was
introduced in PR #115/#116 to reverse mwasm's automatic 4-byte
`sh_size` padding. It trims 2 bytes when a `.text*` section
satisfies `sh_size % 4 == 0` AND `last_two_bytes == 0x00 0x00`.
Brief 204 added reloc-protection: if a relocation patches any
of the last 4 bytes, those zeros are reloc placeholders (the
linker fills them), don't trim. But brief 207 found a NEW
failure mode the brief 204 check doesn't cover: a `.s` whose
last pool word is a small LITERAL value (`.word 0x7fff`, no
relocation, hand-written 4 raw bytes ending in `0x00 0x00`).
The reloc-protection check passes (no reloc → not protected)
so the trim still fires and corrupts the function.

## Concrete reproduction

`func_02023478` (EUR main, 0x80 bytes). Last instruction is
`ldmia sp!, {r3, r4, pc}` followed by three pool words:

```
.L_POOL_A: .word data_0219a8dc  ← reloc (R_ARM_ABS32)
.L_POOL_B: .word data_0219a8dc  ← reloc (R_ARM_ABS32)
.L_POOL_MASK: .word 0x7fff      ← LITERAL: bytes ff 7f 00 00
```

mwasm emits the section at exactly 0x80 bytes (matches the
delinks declaration `.text start:0x02023478 end:0x020234f8`).
Brief 204's trim sees:

  - `sh_size % 4 == 0` ✓ (0x80 is a multiple of 4)
  - last_two_bytes `[0x7e, 0x7f]` = `00 00` ✓
  - reloc_offsets in last 4 bytes (`[0x7c, 0x80)`)? **NO** —
    `data_0219a8dc` pool slots are at offsets 0x74 and 0x78;
    the 0x7c slot is the raw `0x7fff` literal.

Conclusion: trim fires. `sh_size` becomes 0x7e (loses the
`00 00` high bytes of `0x7fff`). The next TU shifts by -2,
and `ninja sha1` fails.

## Why brief 204's reloc-check isn't enough

Brief 204's mental model: "if a reloc covers the tail, those
zeros aren't padding." That's correct for the brief 204
cascade-fill case (a `.word data_X` symbol ref at the end:
bytes are `00 00 00 00` in the .o, linker fills via reloc).
But it doesn't cover the case where the literal IS the
content. The brief 204 check has no way to distinguish
"literal value with zero high bytes" from "actual mwasm
padding."

## The brief 208 fix — delinks-aware trim guard

The signal that distinguishes the two cases is mwasm's
emitted `sh_size`:

  - **Padding case** (mwasm pads): `sh_size > intended_slot_size`
    (mwasm rounded up to 4-byte boundary). E.g. 6-byte Thumb
    thunk → 8-byte section, declared as 6 in delinks.
  - **Literal-tail case**: `sh_size == intended_slot_size`
    (no padding needed; the literal fills the last word
    exactly). The trailing zeros ARE the high bytes of the
    literal value.

`tools/patch_section_align.py` gains a `--delinks <path>`
(repeatable) + `--source-path <path>` CLI pair. The patcher
parses the listed delinks.txt files looking for the TU header
matching `source_path`, reads its `.text start:0xXX end:0xYY`
line, and computes `slot_size = end - start`. In
`trim_text_section_padding`, if `delinks_slot_size is not None
and sh_size == delinks_slot_size`, the trim is suppressed.

mwasm padding ALWAYS produces `sh_size > slot_size` (rounding
UP), so this guard never false-positives on legitimate
padding. The two cases are cleanly separated.

## Wiring

`tools/configure.py`'s `mwasm` ninja rule now passes
`--delinks <project.delinks_files...>` (the project's full
delinks.txt list — arm9 main + each overlay) plus
`--source-path $in`. The patcher does the lookup. The
delinks files are added to `mwasm_implicit` so ninja
re-runs the patcher when delinks.txt changes.

## Cross-corpus coverage — the 6 known affected picks

Brief 207's PR #660 deliberately deferred picks for this
failure mode:

| Module | Address | Last `.word` | Trailing bytes |
|---|---|---|---|
| main | `func_02023478` | `0x7fff` | `ff 7f 00 00` |
| main | `func_020212cc` | `0x618` | `18 06 00 00` |
| ov002 | `0x021aba60` | `0xffff` | `ff ff 00 00` |
| ov002 | `0x021d9828` | `0x868` | `68 08 00 00` |
| ov002 | `0x0220eb00` | `0x868` | `68 08 00 00` |
| ov018 | `0x021ab1c4` | `0x1ff` | `ff 01 00 00` |

All 6 ship cleanly under brief 208's patcher. Brief 208 ships
only `func_02023478` as the worked example (the other 5 are
decomper brief 209+ territory — the patcher fix is the
unblocker, the actual ship work is per-pick).

## Classifier: C-36

`tools/predict_walls.py::detect_literal_tail_trim_trap` is a
new detector. Signal:

  1. Function's last 4 orig bytes have trailing 2 bytes
     `0x00 0x00` (equivalent to: literal value < `0x00010000`).
  2. No relocation lands in the last 4 bytes (otherwise
     brief 204 handles it and C-36 is redundant).

Both conditions must hold. The detector consults orig bytes
(via `read_function_bytes`, mirroring `disasm_function`) and
relocs.txt (via the same `_RELOC_RE` the existing C-32/C-34
detectors use).

Tally: all 6 brief 207 deferred picks fire C-36; the ~32 `.s`
ships from brief 207 that worked DON'T (they end in symbol
refs, so a reloc covers the tail). Brief 205's `.s` ships
likewise DON'T fire (same reason). The detector's cue spells
out the exact literal value so decompers know which mask /
constant they need to encode.

## What "fixed" means precisely

Before brief 208:

  - Patcher trim trap silently corrupts any `.s` ending in a
    small literal. Decomper sees mysterious cascade-shift
    failures; brief 207 attempted the literal-promotion
    workaround (force the high byte non-zero) without
    success — overflows the next slot.

After brief 208:

  - Patcher cross-references delinks.txt; suppresses the
    trim when mwasm-emitted size matches the declared slot
    size. The literal-tail false positive is gone.
  - Classifier flags affected picks so decompers know the
    path is open. No workaround needed in `.s` source.
  - `func_02023478` ships clean (verified: 3-region SHA1
    PASS); the other 5 picks unblocked for brief 209+
    drain.

## Permanence / supersession

This is a **build-tool fix**, not a codegen wall in the
strictest sense — the orig binary content was always
shippable; the patcher was just over-zealous. C-36's entry
in `codegen-walls.md` exists for classifier completeness
(the pattern shows up in disasm and the cue + recipe are
the kind of guidance the taxonomy is meant to provide), but
the "wall" is structurally one-shot: it doesn't generalise
to OTHER mwcc divergences the way C-23 / C-34 do.

If a future toolchain refactor obviates the trim heuristic
entirely (e.g. mwasm gains a `-no-pad` flag), C-36 can be
retired without leaving a regression vector. Until then,
the brief 208 guard + classifier carry their weight.

## Wider lesson

The brief 204 reloc-check protects the cascade-fill case.
Brief 208's delinks-size-match protects the literal-tail
case. Both checks are now in place; the trim heuristic only
fires when:

  - `sh_size % 4 == 0` AND
  - last 2 bytes are `0x00 0x00` AND
  - no relocation covers the last 4 bytes AND
  - delinks declares a slot size DIFFERENT from `sh_size`
    (or no delinks info is supplied — backwards-compatible
    fallback to brief 204 behavior).

Three guards, AND-ed, gating a 2-byte size shave. The
original heuristic was a single byte-pattern check. The
real world keeps adding edge cases; each guard absorbs one
without weakening the others.

## Files touched

  - `tools/patch_section_align.py` — `_lookup_delinks_slot_size`
    helper + `delinks_slot_size` param on
    `trim_text_section_padding` + `--delinks` / `--source-path`
    CLI args.
  - `tools/configure.py` — mwasm ninja rule passes
    `--delinks` + `--source-path $in`.
  - `tools/predict_walls.py` — `detect_literal_tail_trim_trap`
    + `read_function_bytes` helper; wired into `predict_module`
    + single-function `main()` path.
  - `tests/test_patch_section_align.py` — 8 new tests
    (`TestLookupDelinksSlotSize` + `TestTrimDelinksSlotGuard`).
  - `tests/test_predict_walls.py` — 10 new tests
    (`TestC36Detection`).
  - `docs/research/codegen-walls.md` — C-36 entry + counter
    bump (35 → 36 patterns).
  - `src/main/func_02023478.s` — un-deferred worked example.
  - `config/eur/arm9/delinks.txt` — TU declaration for
    func_02023478.

## Provenance trail

- Brief 205 (PR #657) — first attempted `func_02023478`,
  deferred at `.s.deferred` with the trim-trap diagnosis.
- Brief 204 (PR #656) — added reloc-protection to trim,
  covering ONE of two failure modes.
- Brief 207 (PR #660) — re-attempted post-brief-204; the
  literal-tail residual failure mode surfaces explicitly.
  Six picks deferred.
- Brief 208 (this) — adds delinks-aware guard; ships
  worked example + classifier + research note. Closes the
  trim-trap chain.
