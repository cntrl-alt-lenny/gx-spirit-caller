/* func_ov011_021d2d18: single-bit extractor — returns bit 8 of the
 * word at offset 0x40 of struct r0.
 *
 *     ldr r0, [r0, #0x40]   ; r0 = word at p+0x40
 *     mov r0, r0, lsl #0x17 ; shift left 23 — bit 8 -> bit 31 (top)
 *     mov r0, r0, lsr #0x1f ; shift right 31 — extract just the top
 *     bx  lr
 *
 * Net effect: returns `(word >> 8) & 1`. Writing it in the same
 * shift-left/shift-right shape so the compiler produces identical
 * `mov lsl #0x17; mov lsr #0x1f` bytes rather than an AND mask.
 */

unsigned int func_ov011_021d2d18(void *p) {
    return (*(unsigned int *)((char *)p + 0x40) << 23) >> 31;
}
