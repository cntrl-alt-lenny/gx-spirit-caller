/* func_ov002_022a8b54: 2-call helper preserving arg via r4.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_ov002_022a8468
 *     mov   r0, r4
 *     bl    func_ov002_022aa1fc
 *     ldmia sp!, {r4, pc}
 */

extern int func_ov002_022a8468(int x);
extern int func_ov002_022aa1fc(int x);

int func_ov002_022a8b54(int x) {
    func_ov002_022a8468(x);
    return func_ov002_022aa1fc(x);
}
