/* func_02062530: tail-call func_020543b8(p->_c, &func_0206254c, 0).
 *
 *     ldr ip, .L_02062544    ; func_020543b8
 *     ldr r0, [r0, #0xc]     ; arg0 = p->_c
 *     ldr r1, .L_02062548    ; arg1 = &func_0206254c
 *     mov r2, #0x0
 *     bx  ip
 */

extern int func_0206254c(void);
extern int func_020543b8(int a, int (*b)(void), int c);

int func_02062530(int *p) {
    return func_020543b8(p[3], func_0206254c, 0);
}
