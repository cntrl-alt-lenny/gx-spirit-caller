/* func_020a72e0: arg-preserving thunk via r4 (Style B variant).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_020a738c
 *     mov   r0, r4
 *     ldmia sp!, {r4, pc}
 */

extern void func_020a738c(int x);

int func_020a72e0(int x) {
    func_020a738c(x);
    return x;
}
