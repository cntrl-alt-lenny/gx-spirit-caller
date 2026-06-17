/* func_02023520: C-42 — null-check + zero-write + helper + return 1.
 *
 *   push {r3, lr}
 *   ldr r1, [r0]; cmp r1, #0; moveq r0, #0; popeq
 *   mov r1, #0; str r1, [r0]
 *   bl func_02023e04
 *   mov r0, #1; pop
 */

extern void func_02023e04(void);

int func_02023520(int *p) {
    if (*p == 0) return 0;
    *p = 0;
    func_02023e04();
    return 1;
}
