/* func_02004f3c: family 6 — 6-arg wrapper + fn-ptr stack arg.
 *
 *     stmfd sp!, {lr}; sub sp, sp, #0xc
 *     ldr ip, [sp, #0x10]   ; arg4 (stack incoming)
 *     ldr lr, [sp, #0x14]   ; arg5 (stack incoming)
 *     str ip, [sp, #0]; ldr ip, [pool]; str lr, [sp, #4]; str ip, [sp, #8]
 *     bl func_02004ed8(a, b, c, d, e, f, &func_02003aa0)
 *     add sp, sp, #0xc; ldmfd sp!, {pc}
 *
 * Sibling family: 3 main picks with same 6-arg wrapper shape.
 */
extern int func_02003aa0(int x, int y, int z);
extern int func_02004ed8(int a, int b, int c, int d, int e, int f, void *g);

void func_02004f3c(int a, int b, int c, int d, int e, int f) {
    func_02004ed8(a, b, c, d, e, f, (void *)func_02003aa0);
}
