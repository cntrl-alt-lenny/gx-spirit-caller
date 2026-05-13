/* func_ov002_021c93cc: helper-call + bit-test. Returns 1 iff bit `arg2`
 * of helper's result is set.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r2
 *     bl    func_ov002_021c92fc
 *     mov   r1, #0x1
 *     and   r0, r0, r1, lsl r4
 *     cmp   r0, #0x0
 *     movle r1, #0x0
 *     mov   r0, r1
 *     ldmia sp!, {r4, pc}
 */

extern int func_ov002_021c92fc(int a, int b);

int func_ov002_021c93cc(int a, int b, int bit) {
    int v = func_ov002_021c92fc(a, b);
    return (v & (1 << bit)) > 0;
}
