/* func_02020134: helper1(3) + helper2(fnptr) cmp #2 + bool tail.
 *
 *     push {r3, lr}
 *     mov r0, #3; bl func_0201f0e4(3)
 *     ldr r0, [pool fnptr]; bl func_0209f128(fnptr)
 *     cmp r0, #2; moveq r0, #1; popeq
 *     bl func_0201f148; mov r0, #0; pop
 */
extern int func_0201f0e4(int n);
extern int func_02020164(void);   /* fn-ptr arg */
extern int func_0209f128(int (*fn)(void));
extern void func_0201f148(void);

int func_02020134(void) {
    func_0201f0e4(3);
    if (func_0209f128(func_02020164) == 2) return 1;
    func_0201f148();
    return 0;
}
