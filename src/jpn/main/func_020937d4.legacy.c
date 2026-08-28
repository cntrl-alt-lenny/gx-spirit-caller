/* func_020937d4: retry a call with fixed args until it returns 0.
 *
 *     stmdb sp!, {r4, r5, r6, lr}
 *     mov r6, r0, lsl #0x8
 *     mov r5, #0xc
 *     mov r4, #0x0
 * .L_90:
 *     mov r0, r5
 *     mov r1, r6
 *     mov r2, r4
 *     bl func_02096264
 *     cmp r0, #0x0
 *     bne .L_90
 *     ldmia sp!, {r4, r5, r6, lr}
 *     bx lr
 *
 * push{r4,r5,r6,lr} (even count) but 2-step `ldmia...; bx lr`
 * epilogue (not fused) -> Style A -> .legacy.c. No initial jump to
 * a condition check -- the loop body runs unconditionally first, so
 * this is a do-while, not a while.
 */

extern int func_02096264(int a, int b, int c);

void func_020937d4(int a) {
    int shifted = a << 8;
    int c = 0;

    do {
    } while (func_02096264(0xc, shifted, c) != 0);
}
