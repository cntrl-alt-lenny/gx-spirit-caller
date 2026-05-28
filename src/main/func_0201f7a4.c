/* func_0201f7a4: C-42 — fn-ptr arg + branch-on-eq-2 + tail-call.
 *
 *   push {r3, lr}
 *   ldr r0, [pc, #N]   ; r0 = &func_0201f7cc
 *   bl func_0209edc8
 *   cmp r0, #2; moveq r0, #1; popeq
 *   bl func_0201f19c
 *   mov r0, #0; pop
 */

extern int func_0209edc8(void *fn);
extern void func_0201f19c(void);
extern void func_0201f7cc(void);  /* fn-ptr pool target */

int func_0201f7a4(void) {
    if (func_0209edc8((void *)func_0201f7cc) == 2) return 1;
    func_0201f19c();
    return 0;
}
