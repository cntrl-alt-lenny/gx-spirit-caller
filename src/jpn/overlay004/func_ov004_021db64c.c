/* func_ov004_021db64c: thunk — tail-call func_ov004_021c9eb4(&data).
 *
 *     ldr ip, .L_021db86c    ; func_ov004_021c9eb4
 *     ldr r0, .L_021db870    ; data_ov004_02211230
 *     bx  ip
 */

extern int data_ov004_02211230;
extern int func_ov004_021c9eb4(void *p);

int func_ov004_021db64c(void) {
    return func_ov004_021c9eb4(&data_ov004_02211230);
}
