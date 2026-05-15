/* func_0200bfb0: 2x2 decision matrix on (a == 2, b == 2).
 *
 *     cmp   r0, #0x2
 *     bne   .L_0200bfe4
 *     cmp   r1, #0x2
 *     moveq r0, #0x3
 *     movne r0, #0x1
 *     bx    lr
 *   .L_0200bfe4:
 *     cmp   r1, #0x2
 *     moveq r0, #0x2
 *     movne r0, #0x0
 *     bx    lr
 */

int func_0200bfb0(int a, int b) {
    if (a == 2) {
        if (b == 2) return 3;
        return 1;
    }
    if (b == 2) return 2;
    return 0;
}
