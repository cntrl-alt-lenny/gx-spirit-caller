/* func_02001d48: store 1 to `*data_02102b9c` if arg > 0, else store 0.
 *
 *     cmp r0, #0x0
 *     movgt r1, #0x1
 *     ldr r0, .L_02001d80
 *     movle r1, #0x0
 *     str r1, [r0, #0x0]
 *     bx  lr
 */

extern int data_02102b9c;

void func_02001d48(int arg) {
    data_02102b9c = (arg > 0) ? 1 : 0;
}
