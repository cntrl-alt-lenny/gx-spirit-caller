/* func_0209adb4: retry a call with fixed args until it returns 0.
 *
 * Sibling of func_020938c8 -- same callee, same do-while shape, no
 * shift on the passed-through arg and a different constant (8, not
 * 0xc).
 *
 *     stmdb sp!, {r4, r5, r6, lr}
 *     mov r6, r0
 *     mov r5, #0x8
 *     mov r4, #0x0
 * .L_340:
 *     mov r0, r5
 *     mov r1, r6
 *     mov r2, r4
 *     bl func_02096358
 *     cmp r0, #0x0
 *     bne .L_340
 *     ldmia sp!, {r4, r5, r6, lr}
 *     bx lr
 *
 * push{r4,r5,r6,lr} even count, 2-step epilogue -> .legacy.c.
 */

extern int func_02096358(int a, int b, int c);

void func_0209adb4(int a) {
    int c = 0;

    do {
    } while (func_02096358(0x8, a, c) != 0);
}
