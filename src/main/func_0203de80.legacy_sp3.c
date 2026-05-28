/* func_0203de80: stmfd-only prologue + helper-chain + ternary tail.
 *
 *     stmfd sp!, {lr}; sub sp, sp, #4
 *     mov r0, #1; bl func_0203c900(1)
 *     add r0, r0, #0xa
 *     bl func_0203dc10(h1+10)
 *     cmp r0, #1; moveq r0, #0x12; movne r0, #0x11
 *     pop
 */
extern int func_0203c900(int n);
extern int func_0203dc10(int n);

int func_0203de80(void) {
    int r = func_0203dc10(func_0203c900(1) + 0xa);
    return (r == 1) ? 0x12 : 0x11;
}
