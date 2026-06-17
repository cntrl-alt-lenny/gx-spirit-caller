/* func_0201f750: C-42 — fn-ptr arg + branch-on-eq-2 + tail-call.
 *
 *   push {r3, lr}
 *   ldr r0, [pc, #N]   ; r0 = &func_0201f778
 *   bl func_0209ecd4
 *   cmp r0, #2; moveq r0, #1; popeq
 *   bl func_0201f148
 *   mov r0, #0; pop
 */

extern int func_0209ecd4(void *fn);
extern void func_0201f148(void);
extern void func_0201f778(void);  /* fn-ptr pool target */

int func_0201f750(void) {
    if (func_0209ecd4((void *)func_0201f778) == 2) return 1;
    func_0201f148();
    return 0;
}
