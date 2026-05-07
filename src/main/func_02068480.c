/* func_02068480: returns 1 iff `arg == *data_0219eccc`.
 *
 *     ldr r1, .L_02068498
 *     ldr r1, [r1, #0x0]
 *     cmp r0, r1
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     bx  lr
 */

extern int data_0219eccc;

int func_02068480(int arg) {
    return arg == data_0219eccc;
}
