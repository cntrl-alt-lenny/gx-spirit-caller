/* data_ov011_021d2ff8 (20 bytes, 4-aligned): 5-slot (short,short) table,
 * same shape as proven siblings data_ov011_021d300c.c and
 * data_ov011_021d2fe4.c: (0x28,0x18), (0x20,0x18) x4.
 *
 * Consumer: src/overlay011/func_ov011_021cb574.s (1520-byte GLOBAL_ASM
 * cross-overlay-BL wall, brief 192/197/209). Hand-decoded both the
 * base-pointer load AND the per-slot read instruction (more than the
 * "not further hand-disassembled" caveat sibling data_ov011_021d2fe4.c
 * settled for):
 *   - `.word 0xe59f8384` at ARM addr 0x021cb7b4 (file line 192) =
 *     `ldr r8,[pc,#0x384]`; pc=0x021cb7bc, +0x384=0x021cbb40, matching
 *     relocs.txt:313 `from:0x021cbb40 kind:load to:0x021d2ff8` exactly
 *     -> r8 = &data_ov011_021d2ff8. Same 5-wide literal-pool burst
 *     (5 consecutive `ldr rX,[pc,#0x384]`, file lines 191-195) that also
 *     loads r10=&data_ov011_021d41a0, r7=&data_ov011_021d2fe4,
 *     r6=func_ov011_021cc4c8 (callback), r5=&data_ov011_021d2fb4 --
 *     cross-checked against relocs.txt:312-316.
 *   - Loop body (file lines 196-200): `mov r9,#0` (idx=0), then
 *     `add r0,r8,r9,lsl#2` (line 197, ARM addr 0x021cb7c8) -> r0 =
 *     &data_ov011_021d2ff8[idx] at word/4-byte stride (5 slots of 4
 *     bytes = this symbol's 20-byte size exactly); `ldrh r1,[r0,#2]`
 *     (line 198, ARM addr 0x021cb7cc) reads the SECOND short of the
 *     pair as an unsigned halfword -> `unsigned short` element type
 *     (matches data_ov011_021d2fe4.c's typing choice). The identical
 *     `base+idx*4` idiom repeats one instruction later for the proven
 *     sibling: `add r0,r7,r9,lsl#2` (line 200, data_ov011_021d2fe4[idx])
 *     -- same per-actor loop, back to back.
 *
 * .rodata ground truth (delinks.txt:2) -> `const`.
 */

const unsigned short data_ov011_021d2ff8[10] = {
    0x0028, 0x0018,
    0x0020, 0x0018,
    0x0020, 0x0018,
    0x0020, 0x0018,
    0x0020, 0x0018,
};
