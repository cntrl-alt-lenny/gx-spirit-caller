/* func_ov002_022a8c90: 2-call helper preserving arg via r4.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_ov002_022a85a4
 *     mov   r0, r4
 *     bl    func_ov002_022aa338
 *     ldmia sp!, {r4, pc}
 */

extern int func_ov002_022a85a4(int x);
extern int func_ov002_022aa338(int x);

int func_ov002_022a8c90(int x) {
    func_ov002_022a85a4(x);
    return func_ov002_022aa338(x);
}
