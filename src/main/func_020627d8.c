/* func_020627d8: 2-call helper passing the same arg to both
 * (using r4 to preserve across the first call). Style B.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_02062530
 *     mov   r0, r4
 *     bl    func_02064aa0
 *     ldmia sp!, {r4, pc}
 */

extern int func_02062530(int x);
extern int func_02064aa0(int x);

int func_020627d8(int x) {
    func_02062530(x);
    return func_02064aa0(x);
}
