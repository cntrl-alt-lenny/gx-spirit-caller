/* func_020744f8: tail-call func_02094500(&data_021a063c, 0, 0x170).
 *
 *     ldr ip, .L_020745f4    ; func_02094500
 *     ldr r0, .L_020745f8    ; data_021a063c
 *     mov r1, #0x0
 *     mov r2, #0x170
 *     bx  ip
 */

extern int func_02094500(void *p, int a, int b);

extern char data_021a063c[];

int func_020744f8(void) {
    return func_02094500(data_021a063c, 0, 0x170);
}
