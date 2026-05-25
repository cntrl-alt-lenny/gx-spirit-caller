/* func_ov004_021db860: thunk — tail-call func_ov004_021c9f94(&data).
 *
 *     ldr ip, .L_021db86c    ; func_ov004_021c9f94
 *     ldr r0, .L_021db870    ; data_ov004_02211490
 *     bx  ip
 */

extern int data_ov004_02211490;
extern int func_ov004_021c9f94(void *p);

int func_ov004_021db860(void) {
    return func_ov004_021c9f94(&data_ov004_02211490);
}
