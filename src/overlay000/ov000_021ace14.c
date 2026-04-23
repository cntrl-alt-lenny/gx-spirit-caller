/* func_ov000_021ace14: bitfield setter — clear field mask 0x2000000
 * at obj+0x98, write (val << 31) >> 6.
 *
 * mwcc emits this as:
 *     ldr r2, [r0, #0x98]
 *     mov r1, r1, lsl #0x1f
 *     bic r2, r2, #0x2000000
 *     orr r1, r2, r1, lsr #0x6
 *     str r1, [r0, #0x98]
 *     bx  lr
 *
 * Using the `(val << N) >> M` shift idiom (not `(val & mask) << shift`)
 * mirrors the baserom's barrel-shifter form. See ov011_021d2278 PR
 * #126 for the tst-vs-shift codegen note.
 */

void func_ov000_021ace14(void *p, unsigned val) {
    unsigned *word = (unsigned *)((char *)p + 0x98);
    *word = (*word & ~0x2000000u) | ((val << 31) >> 6);
}
