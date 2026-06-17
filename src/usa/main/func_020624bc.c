/* func_020624bc: tail-call func_02054344(p->_c, &func_020624d8, 0).
 *
 *     ldr ip, .L_02062544    ; func_02054344
 *     ldr r0, [r0, #0xc]     ; arg0 = p->_c
 *     ldr r1, .L_02062548    ; arg1 = &func_020624d8
 *     mov r2, #0x0
 *     bx  ip
 */

extern int func_020624d8(void);
extern int func_02054344(int a, int (*b)(void), int c);

int func_020624bc(int *p) {
    return func_02054344(p[3], func_020624d8, 0);
}
