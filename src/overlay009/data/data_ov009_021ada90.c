/* data_ov009_021ada90 (12 bytes, 4-aligned): Ov009HitRect021ada90 -- one
 * UI-element rect (screen x, y, w, h, draw-kind, extra draw param).
 *
 * Element 10 of a single 12-byte-stride array based at data_ov009_021ada18
 * (already shipped, src/overlay009/data/data_ov009_021ada18.c, as
 * `int data_ov009_021ada18 = 0x7e0024;` -- retyping that already-landed
 * file is OUT OF SCOPE for this wave, but its two halfwords, 0x0024=36
 * and 0x007e=126, are a plausible x/y pair in the same coordinate family
 * described below, i.e. it is likely logically element 0 of this same
 * array even though it was carved earlier as a bare scalar). Base+stride
 * are proven directly from func_ov009_021ab9f8.s's index arithmetic:
 * `mov r0,#0xc; mla r2,r1,r0,r2` with r2 initially `_LIT1 =
 * data_ov009_021ada18` (lines 65/80/87) -- i.e. element[n] =
 * data_ov009_021ada18 + n*12. 0x021ada18 + 10*12(0x78) = 0x021ada90
 * exactly, and the same arithmetic run continues through n=16
 * (0x021adad8) before the next already-carved symbol
 * data_ov009_021adae4 (n=17, out of scope this wave).
 *
 * Two real consumers (the census's reloc-based count is 1 for this
 * symbol -- see the loop note below for why the second is real but
 * invisible to a same-address reloc grep):
 *  1. func_ov009_021ac4d0.s (Ov009_Scene_Update), state 0: line 354
 *     `ldr r1,_LIT2` / `_LIT2: .word data_ov009_021ada90` (line 687),
 *     then `bl func_ov009_021ac458` (Ov009_HitTest_AABB) at line 356.
 *     relocs.txt:296 `from:0x021ace4c kind:load to:0x021ada90
 *     module:overlay(9)`. func_ov009_021ac458.s reads exactly 4
 *     halfwords off the passed pointer: `ldrh r1,[r4]` (x, cmp vs
 *     touchX), `ldrh r0,[r4,#4]` (w, x+w cmp vs touchX), `ldrh
 *     r1,[r4,#2]` (y, cmp vs touchY), `ldrh r0,[r4,#6]` (h, y+h cmp vs
 *     touchY) -- textbook AABB point-in-rect, confirming offsets
 *     +0/+2/+4/+6 = x/y/w/h.
 *  2. func_ov009_021ab9f8.s (Ov009_ScoreCtrl_DrawFrame)'s 12-iteration
 *     sprite-draw loop (.L_3c0, lines 216-255): `ldr r8,_LIT1`
 *     (=data_ov009_021ada18, line 210), `add r8,r8,#0xc` each of 12
 *     iterations (r7 = 0..11) -- walks elements n=0..11, which includes
 *     n=10 (this symbol) and n=11 (data_ov009_021ada9c). Each iteration
 *     reads x@+0/y@+2 (lines 217-218) for sprite position and
 *     kind@+8/unkA@+0xa (lines 235/239) as extra params fed to
 *     func_0201e964. This access is real (docs/research/map/overlay009.md
 *     independently calls it "12 card-slot thumbnail sprites") but is a
 *     relocation to data_ov009_021ada18 (the loop's base), not to this
 *     symbol's own address -- hence invisible to a same-address
 *     relocs.txt grep, and not counted in the census's reader tally.
 *
 * All reads are `ldrh` (never `ldrsh`) -> `unsigned short` fields.
 * Falls in ov009's `.data start:0x021ad900 end:0x021adbc0`, so fields
 * stay non-const (must NOT be const -- relocates to .rodata at link
 * time otherwise, breaking byte-identity).
 * kind=2 here; contrast data_ov009_021adacc.c, the one sibling with
 * kind=0 (also the only one gated behind an extra runtime check).
 *
 * Sibling family (same typedef, same 12-byte stride, same two
 * consumers): data_ov009_021ada9c, data_ov009_021adaa8,
 * data_ov009_021adab4, data_ov009_021adac0, data_ov009_021adacc,
 * data_ov009_021adad8 -- see each sibling file for its own specific
 * citation.
 */
typedef struct {
    unsigned short x, y, w, h;
    unsigned short kind;
    unsigned short unkA;
} Ov009HitRect021ada90;

Ov009HitRect021ada90 data_ov009_021ada90 = { 81, 126, 39, 28, 2, 0 };
