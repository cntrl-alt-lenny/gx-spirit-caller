/* func_020952f0: retry loop — call func_02096264(7,0,0) until non-negative.
 * Style A (2-step epilogue).
 *
 *     stmdb sp!, {r4, r5, lr}
 *     sub   sp, sp, #0x4
 *     mov   r5, #0x7
 *     mov   r4, #0x0
 *   .L_10:
 *     mov   r0, r5
 *     mov   r1, r4
 *     mov   r2, r4
 *     bl    func_02096264
 *     cmp   r0, #0x0
 *     blt   .L_10
 *     add   sp, sp, #0x4
 *     ldmia sp!, {r4, r5, lr}
 *     bx    lr
 */

extern int func_02096264(int a, int b, int c);

int func_020952f0(void) {
    int r;
    do {
        r = func_02096264(7, 0, 0);
    } while (r < 0);
    return r;
}
