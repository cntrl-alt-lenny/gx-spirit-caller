/* func_02057cb8: C-42 — helper1(c); helper2(a, b, c, helper1_result).
 *
 *   push {r4, r5, r6, lr}
 *   mov r4, r2; mov r6, r0; mov r5, r1
 *   mov r0, r4; bl func_020aace8(c)
 *   mov r3, r0; mov r0, r6; mov r1, r5; mov r2, r4
 *   bl func_02057ce8(a, b, c, r)
 *   pop
 */

extern int func_020aace8(int c);
extern void func_02057ce8(int a, int b, int c, int r);

void func_02057cb8(int a, int b, int c) {
    int r = func_020aace8(c);
    func_02057ce8(a, b, c, r);
}
