/* func_020a6bd4: tail-call func_020b2ff0(*(int *)data_02102758).
 *
 *     ldr r0, .L_020a6cd8    ; &data_02102758
 *     ldr ip, .L_020a6cdc    ; func_020b2ff0
 *     ldr r0, [r0, #0x0]
 *     bx  ip
 */

extern int data_02102758;
extern int func_020b2ff0(int x);

int func_020a6bd4(void) {
    return func_020b2ff0(data_02102758);
}
