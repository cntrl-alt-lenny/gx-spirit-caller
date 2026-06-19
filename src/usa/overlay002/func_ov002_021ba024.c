/* func_ov002_021ba024: 2-call composition preserving arg2 across
 * the first call.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r2
 *     bl    func_ov002_021b9dec
 *     mov   r1, r4
 *     bl    func_0202df24
 *     ldmia sp!, {r4, pc}
 */

extern int func_ov002_021b9dec(int a, int b);
extern int func_0202df24(int x, int y);

int func_ov002_021ba024(int a, int b, int c) {
    return func_0202df24(func_ov002_021b9dec(a, b), c);
}
