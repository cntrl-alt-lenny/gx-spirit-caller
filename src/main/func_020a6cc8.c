/* func_020a6cc8: tail-call func_020b30e4(*(int *)data_02102838).
 *
 *     ldr r0, .L_020a6cd8    ; &data_02102838
 *     ldr ip, .L_020a6cdc    ; func_020b30e4
 *     ldr r0, [r0, #0x0]
 *     bx  ip
 */

extern int data_02102838;
extern int func_020b30e4(int x);

int func_020a6cc8(void) {
    return func_020b30e4(data_02102838);
}
