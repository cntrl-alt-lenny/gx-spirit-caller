/* func_02020188: helper1(3) + helper2(fnptr) cmp #2 + bool tail.
 *
 *     push {r3, lr}
 *     mov r0, #3; bl func_0201f138(3)
 *     ldr r0, [pool fnptr]; bl func_0209f21c(fnptr)
 *     cmp r0, #2; moveq r0, #1; popeq
 *     bl func_0201f19c; mov r0, #0; pop
 */
extern int func_0201f138(int n);
extern int func_020201b8(void);   /* fn-ptr arg */
extern int func_0209f21c(int (*fn)(void));
extern void func_0201f19c(void);

int func_02020188(void) {
    func_0201f138(3);
    if (func_0209f21c(func_020201b8) == 2) return 1;
    func_0201f19c();
    return 0;
}
