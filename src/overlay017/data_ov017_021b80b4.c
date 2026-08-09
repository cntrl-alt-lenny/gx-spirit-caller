/* data_ov017_021b80b4 / _021b80be (20 bytes total, 4-aligned at both ends:
 * 0x021b80b4..0x021b80c8): TU-composition carve of 2 adjacent 2-byte-
 * misaligned candidates per docs/research/alignment-wall-tu-composition-
 * recipe.md -- data_ov017_021b80b4 (mod4=0 start, 10-byte size, mod4=2
 * end), data_ov017_021b80be (mod4=2 start, mod4=0 end). Individually each
 * would hit the ALIGNALL(2) wall; declared here as 2 separate named
 * globals of the same 10-byte record type, in address order, in ONE TU
 * whose combined .data section is 20 bytes (4-aligned).
 *
 * SPLIT FROM A 4-SYMBOL BUNDLE: this run and _021b80a0/_021b80aa (in the
 * sibling file data_ov017_021b80a0.c) were originally investigated and
 * drafted as ONE 4-symbol, 40-byte TU. Compiling that draft and
 * inspecting the .o symbol table (per this recipe doc's explicit
 * "spot-test a 3+ symbol group for reordering" warning) showed mwcc does
 * NOT preserve declaration order at n=4 -- see data_ov017_021b80a0.c's
 * own header comment for the full finding. Since 0x021b80b4 is itself
 * 4-aligned, the bundle splits cleanly into two independently
 * both-ends-passing n=2 TUs instead.
 *
 * Both are real, independently-addressed elements of a 5-element,
 * 10-byte-stride array (elements 2-3 here; elements 0-1 in the sibling
 * data_ov017_021b80a0.c; element 4 the already-shipped, wave-3-carved
 * 12-byte `Box` data_ov017_021b80c8.c). Confirmed via
 * src/overlay017/func_ov017_021b312c.s: loads each by its own
 * literal-pool `.word` as a direct base pointer for a "menu row"
 * hit-test+forward block (relocs.txt:166/167, from:0x021b33d0/33d4
 * kind:load to:0x021b80b4/80be module:overlay(17)) -- each block does
 * `mov r0,<sym>; bl func_ov017_021b2ce4` (hit-test) then `mov r3,<sym>;
 * ...; bl func_ov017_021b4090` (box-offset forward), the same shape as
 * the sibling file's own 2 elements. Both symbols have exactly one
 * relocs.txt hit each (the direct literals above); git grep across the
 * whole src/ and config/ trees finds no other consumer for either -- see
 * data_ov017_021b80a0.c's own header comment for the full-array indexed
 * access proof (that generic-index arithmetic lives in the same
 * function and covers the whole 5-element array, elements 0-4).
 *
 * Field shape: identical evidenced layout to the sibling run
 * data_ov017_021b80a0.c (see that file's header for the full Rect+Box
 * field-by-field citation) -- Rect{x,y,w,h} at +0/+2/+4/+5
 * (func_ov017_021b2ce4.c / func_ov017_021b2d5c.c, both MATCHED, byte-exact
 * `ldrb` at +4/+5) plus Box{f6,f8} at +6/+8 forwarded verbatim by
 * func_ov017_021b4090.c. All 10 bytes of each element accounted for; no
 * reuse of the 12-byte `Box` typedef (wrong size for a 10-byte stride).
 *
 * Values (both share y=165, w=h=26, f6=2, f8=1, matching the sibling
 * file and the shipped data_ov017_021b80c8; x=83/115, the same +32px
 * stride as the sibling run): extracted via extract_bytes.py from
 * extract/eur/arm9_overlays/ov017.bin (pristine) and cross-checked
 * identical against build/eur/build/arm9_ov017.bin.
 *
 * Section: config/eur/arm9/overlays/ov017/delinks.txt line 5,
 * `.data start:0x021b8020 end:0x021b8520` -- this whole 20-byte span
 * falls inside, so neither symbol may be `const`. No field's value falls
 * in the 0x02xxxxxx ARM9/overlay address range and relocs.txt has zero
 * `from:` entries originating inside 0x021b80b4-0x021b80c8, so none of
 * the 10 bytes per element is itself a relocated pointer.
 */

typedef struct {
    unsigned short f0;  /* Rect x  == Box f0 */
    unsigned short f2;  /* Rect y  == Box f2 */
    unsigned char  f4;  /* Rect w */
    unsigned char  f5;  /* Rect h */
    unsigned short f6;  /* Box f6, forwarded verbatim by func_ov017_021b4090 */
    unsigned short f8;  /* Box f8, forwarded verbatim by func_ov017_021b4090 */
} Ov017Record021b80a0; /* sizeof = 10; same shape/name as data_ov017_021b80a0.c's type */

Ov017Record021b80a0 data_ov017_021b80b4 = { 83, 165, 26, 26, 2, 1 };
Ov017Record021b80a0 data_ov017_021b80be = { 115, 165, 26, 26, 2, 1 };
