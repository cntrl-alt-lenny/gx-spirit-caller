/* func_ov002_022bde80: signed halfword comparator — sibling of
 * func_ov002_022bdde0 (same 4-insn `*a - *b` shape, different
 * call sites).
 *
 *     ldrsh r2, [r0, #0x0]
 *     ldrsh r0, [r1, #0x0]
 *     sub   r0, r2, r0
 *     bx    lr
 */

int func_ov002_022bde80(short *a, short *b) {
    return *a - *b;
}
