/* func_0200bfa4: 2x2 decision matrix returning 0/1/2/3.
 *
 *     cmp   r0, #0x0
 *     beq   .L_0200bfbc
 *     cmp   r1, #0x0
 *     movne r0, #0x3
 *     moveq r0, #0x1
 *     bx    lr
 *   .L_0200bfbc:
 *     cmp   r1, #0x0
 *     movne r0, #0x2
 *     moveq r0, #0x0
 *     bx    lr
 */

int func_0200bfa4(int a, int b) {
    if (a) {
        if (b) return 3;
        return 1;
    }
    if (b) return 2;
    return 0;
}
