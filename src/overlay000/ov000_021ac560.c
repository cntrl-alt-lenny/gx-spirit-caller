/* func_ov000_021ac560: bitfield setter — clear field mask 0x2
 * at obj+0x0, write (val << 31) >> 30.
 *
 * mwcc emits this as:
 *     ldr r2, [r0, #0x0]
 *     mov r1, r1, lsl #0x1f
 *     bic r2, r2, #0x2
 *     orr r1, r2, r1, lsr #0x1e
 *     str r1, [r0, #0x0]
 *     bx  lr
 *
 * Using the `(val << N) >> M` shift idiom (not `(val & mask) << shift`)
 * mirrors the baserom's barrel-shifter form. See ov011_021d2278 PR
 * #126 for the tst-vs-shift codegen note.
 */

void func_ov000_021ac560(void *p, unsigned val) {
    unsigned *word = (unsigned *)((char *)p + 0x0);
    *word = (*word & ~0x2u) | ((val << 31) >> 30);
}
