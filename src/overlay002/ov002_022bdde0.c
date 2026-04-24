/* func_ov002_022bdde0: signed halfword comparator — `*(short*)a - *(short*)b`.
 *
 *     ldrsh r2, [r0, #0x0]
 *     ldrsh r0, [r1, #0x0]
 *     sub   r0, r2, r0
 *     bx    lr
 */

int func_ov002_022bdde0(short *a, short *b) {
    return *a - *b;
}
