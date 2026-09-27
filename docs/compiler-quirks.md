# Compiler quirks

What the toolchain does that a first attempt at matching a function in this game
will not expect. Each entry says what you see, why, what to do, which compiler
tier it concerns, and where the full write-up is. Every source path is at the
git tag `archive/pre-redesign-2026-09-23`; read one with
`git show archive/pre-redesign-2026-09-23:<path>`.

The three tiers are chosen by file name ([`BUILD.md`](../BUILD.md)): `.c` is
mwcc 2.0/sp1p5, `.legacy.c` is 1.2/sp2p3 and `.legacy_sp3.c` is 1.2/sp3. All
share the same flags.

## Picking the tier

### Two-step epilogue: `pop {regs, lr}; bx lr`

- **See:** the body matches but the return is `pop {..., pc}` where the target
  has `pop {..., lr}` then `bx lr`.
- **Cause:** only mwcc 1.2/sp2p3 and earlier emit the two-step return. No flag
  or pragma makes 2.0 do it (`-O0` does, but also spills arguments).
- **Do:** rename the file to `.legacy.c`.
- **Tier:** 1.2/sp2p3.
- **Source:** `docs/research/style-a-epilogue.md`.

### `push` without r3 plus `sub sp, #4`, returning `pop {..., pc}`

- **See:** 2.0 pushes an extra `r3` to keep the stack 8-aligned, while the
  target pushes the real registers and does `sub sp, sp, #4`.
- **Cause:** that prologue with a one-step return is 1.2/sp3 only.
- **Do:** rename to `.legacy_sp3.c`. Classify by the epilogue first:
  `sub sp, #4` appears in both 1.2 tiers and is sometimes absent from
  either, so only the pop shape tells sp2p3 from sp3.
- **Tier:** 1.2/sp3.
- **Source:** `docs/research/sp3-routing-decision.md` and the pitfall notes in
  `docs/research/style-a-epilogue.md`.

### Leaf function with a completely different shape

- **See:** no prologue at all, yet the 2.0 compile diverges from the first few
  instructions, with a different instruction count.
- **Cause:** 2.0 has peepholes the 1.2 tiers lack. It turns a 16-bit mask
  `and` into an `lsl`/`lsr` pair, folds several MMIO base addresses into one,
  rewrites `ands; bne` as `tst; bne` and uses `mvn` where flat thunks had
  `sub`.
- **Do:** try the same body as `.legacy.c` before reshaping the C.
- **Tier:** 2.0 (the fix is 1.2/sp2p3).
- **Source:** `docs/research/codegen-walls.md` C-71, C-15 and C-23.

## Reading objdiff

### objdiff under 100% on a unit that links byte-identical

- **See:** `ninja sha1` passes but a `.legacy.c`, `.legacy_sp3.c` or `.s`
  unit is not counted as matched.
- **Cause:** objdiff compares unlinked objects, and our objects carry more or
  different relocation records than `dsd delink`'s. `objdiff_resolve_relocs.py`
  applies relocations to a fixed base before the comparison, which fixed most
  of these. A hand-written `.s` with raw `.word` literals can still differ.
- **Do:** trust the three-ROM SHA-1. Look at the resolved diff only for a real
  byte difference.
- **Tier:** all.
- **Source:** `docs/research/objdiff-fuzzy-vs-complete-metric.md`.

### `ninja report` fails for units you did not touch

- **See:** objdiff-cli panics in its ARM code, or reports a missing target
  object.
- **Cause:** an upstream objdiff bug on `.text` with no function symbol, and
  routed units whose object was never built.
- **Do:** nothing. `objdiff_filter_panic_units.py` drops those units before the
  report. Do not "fix" them in source.
- **Tier:** none (tooling).
- **Source:** `docs/research/objdiff-arm-crash-workaround.md`.

## Layout and linking

### Two-byte shifts after a Thumb unit

- **See:** everything after a small Thumb unit is shifted by 2 bytes.
- **Cause:** mwcc emits Thumb `.text` 4-aligned, dsd's linker script has
  `ALIGNALL(4)` and mwasmarm pads `.text` to a multiple of 4.
  `patch_section_align.py` and `patch_lcf_arm9_align.py` undo all three in the
  build.
- **Do:** check that those build steps ran (a full `ninja`). Ship SWI and
  other tiny Thumb thunks as one `.s` each, like `src/main/Div.s`: dsd
  rejects a unit with several separate `.text` ranges.
- **Tier:** all.
- **Source:** `docs/research/thumb-align-wall.md`.

### 8- or 12-byte shims, and ov004's data moving by 0x400

- **See:** a `func_<addr>` that is only `ldr; bx` plus a word; or ov004
  `.rodata`, `.data` and `.bss` shifted by about 1 KB.
- **Cause:** mwldarm makes interwork veneers. ov004's come from its data
  symbols sharing addresses with ov002 functions (the two overlays share a
  base). `patch_ov004_veneers.py` and `ALIGNALL(2)` on ov004 undo them in the
  build.
- **Do:** ship a shim as `.s` with an explicit `.thumb` or `.arm` directive.
  Never pass `-nointerworking`: it fixes ov004 and breaks ov002.
- **Tier:** mwldarm 2.0/sp1p5.
- **Source:** `docs/research/ov004-thunk-section-fix.md` and
  `docs/research/codegen-walls.md` C-31.

### `Undefined: "func_<addr>"` from a `bl`

- **See:** the link fails on a call into an address that several overlays
  share.
- **Cause:** dsd cannot tell which overlay the call targets.
- **Do:** name the target in the right module's `symbols.txt` if it is known.
  Otherwise ship the function as `.s` with the call as a hand-encoded `.word`.
- **Tier:** none (analysis).
- **Source:** `docs/research/codegen-walls.md` C-32.

## Source shape

### Pool words: one too many, or one too few

- **See:** the target loads the same address from one pool word where you get
  two, or from two words where you get one.
- **Cause:** mwcc deduplicates pool literals by symbol.
- **Do:** to get one word, use one global, not two views of it, and try
  `.legacy_sp3.c`. To get two, declare two distinct externs and alias the
  second in `symbols.txt`.
- **Tier:** one word is 1.2/sp3; two words is 2.0.
- **Source:** `docs/research/codegen-walls.md` C-24 and C-27.

### Predicated instead of branched, or the reverse

- **See:** `moveq`/`addne` runs where the target branches, or the reverse.
- **Cause:** mwcc if-converts short bodies. The spelling of the test matters:
  `if (!p)` and `if (p == 0)` compile differently. Conditional moves follow
  the source's true-branch order.
- **Do:** try `!p`; flip the ternary or the guard polarity; use `goto` to a
  shared tail where the target branches to it. Each guard in a function can
  need a different form.
- **Tier:** 2.0 mainly.
- **Source:** `docs/research/codegen-walls.md` C-1, C-29 and C-55, and
  `docs/research/reshape-recipes/lever-payoff.md` ranks 1, 12, 13 and 17.

### A load the target repeats is missing

- **See:** the target reads a field twice, or again right after storing it;
  you get one load.
- **Cause:** common-subexpression elimination, even with no aliasing.
- **Do:** make that one struct member `volatile`, not the whole struct or
  pointer. Re-reading through an output pointer, not a local, does the same
  for out-parameters.
- **Tier:** all.
- **Source:** `docs/research/codegen-walls.md` C-3 and C-73, and
  `docs/research/reshape-recipes/lever-payoff.md` rank 2.

### Same instructions, different registers

- **See:** a register-letter swap and nothing else.
- **Cause:** the allocator follows declaration order, operand order and which
  argument registers are still live.
- **Do:** reorder the declarations to the target's order, swap commutative
  operands, keep the incoming arguments live the way the target does, cast
  pointer arithmetic to integers to control the base register. Stop after a
  few tries: a swap that survives these is a documented plateau, not worth
  more attempts.
- **Tier:** 2.0 mainly; 1.2/sp2p3 has its own plateau.
- **Source:** `docs/research/codegen-walls.md` C-56, C-57, C-81, P-4, P-11 and
  P-15.

### Shifts and masks come out wrong

- **See:** one `and` where the target has `lsl`/`lsr`, or the reverse; a
  modulo that is a `mul` where the target has `smull`.
- **Cause:** mwcc rewrites masks and shift pairs in its own preferred form.
- **Do:** use a real C bitfield to get the shift pair, `unsigned char` rather
  than `& 0xff` to keep the byte mask, and write `%` directly rather than
  expanding it by hand.
- **Tier:** 2.0.
- **Source:** `docs/research/codegen-walls.md` C-17, C-22, C-52 and C-53.

### A `switch` from a jump table is off by one everywhere

- **See:** very low match on a function whose dispatch is
  `addls pc, pc, idx, lsl #2`.
- **Cause:** ARM reads `pc` as the instruction's address plus 8, so case 0 is
  the table's second row.
- **Do:** read the table from one row after the dispatch instruction.
- **Tier:** all.
- **Source:** `docs/research/codegen-walls.md` C-47.

### An offset above 0xfff is stored to the wrong address

- **See:** the target does `add` then `str [rN, #off]`; your compile folds
  both into one `str` whose offset has lost its high bits.
- **Cause:** a 2.0 constant-folding bug; no C spelling tried avoids it.
- **Do:** ship the function as `.s`.
- **Tier:** 2.0.
- **Source:** `docs/research/codegen-walls.md` P-41.

## Writing `.s`

- **See:** assembler errors, or a `.s` that breaks bytes in other modules.
- **Cause:** mwasmarm takes `swi 0x...` and coprocessor operands without `#`.
  `ldr rN, =data_label` pseudo-ops place literal pools differently from mwcc,
  which once broke every module in the rebuild.
- **Do:** start from an existing `.s`: `src/main/Div.s` for a SWI,
  `src/main/func_02000950.s` for coprocessor access. Write literal pools out
  by hand.
- **Tier:** mwasmarm 2.0/sp1p5.
- **Source:** `docs/research/codegen-walls.md` C-8 and
  `docs/research/sp3-routing-decision.md`.
