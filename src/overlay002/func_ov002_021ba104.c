/* func_ov002_021ba104: 2-call composition preserving arg2 across
 * the first call.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r2
 *     bl    func_ov002_021b9ecc
 *     mov   r1, r4
 *     bl    func_0202df78
 *     ldmia sp!, {r4, pc}
 */

extern int func_ov002_021b9ecc(int a, int b);
extern int func_0202df78(int x, int y);

int func_ov002_021ba104(int a, int b, int c) {
    return func_0202df78(func_ov002_021b9ecc(a, b), c);
}
