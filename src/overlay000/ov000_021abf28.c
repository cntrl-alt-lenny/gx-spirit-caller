/* func_ov000_021abf28: 1-bit setter at bit-0 of obj+0x0.
 *
 *     ldr r2, [r0, #0x0]
 *     and r1, r1, #0x1             ; val & 1
 *     bic r2, r2, #0x1             ; word &= ~1
 *     orr r1, r2, r1               ; merge
 *     str r1, [r0, #0x0]
 *     bx  lr
 *
 * The natural `word = (word & ~1) | (val & 1)` form. mwcc's choice
 * of AND-then-BIC-then-ORR matches when the field is at bit 0.
 */

void func_ov000_021abf28(void *p, unsigned val) {
    unsigned *word = (unsigned *)p;
    *word = (*word & ~1u) | (val & 1u);
}
