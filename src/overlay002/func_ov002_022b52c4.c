/* func_ov002_022b52c4: C-42 — helper(2, 3); *p = 0;
 *
 *   push {r4, lr}; mov r4, r0
 *   mov r0, #2; mov r1, #3; bl func_0202c948
 *   mov r0, #0; str r0, [r4]; pop
 */

extern void func_0202c948(int a, int b);

void func_ov002_022b52c4(int *p) {
    func_0202c948(2, 3);
    *p = 0;
}
