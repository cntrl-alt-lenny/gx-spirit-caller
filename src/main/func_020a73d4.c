/* func_020a73d4: arg-preserving thunk via r4 (Style B variant).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_020a7480
 *     mov   r0, r4
 *     ldmia sp!, {r4, pc}
 */

extern void func_020a7480(int x);

int func_020a73d4(int x) {
    func_020a7480(x);
    return x;
}
