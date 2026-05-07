/* func_ov002_022a3918: returns 1 iff `*r0` is non-zero.
 *
 *     ldr r0, [r0, #0x0]
 *     cmp r0, #0x0
 *     movne r0, #0x1
 *     moveq r0, #0x0
 *     bx  lr
 */

int func_ov002_022a3918(int *p) {
    return *p != 0;
}
