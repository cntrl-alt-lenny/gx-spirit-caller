/* func_02036298: null-guarded 2-call helper. Style B with
 * predicated `ldmeqia` early-return.
 *
 *     stmdb sp!, {r3, lr}
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r3, pc}
 *     bl    func_0203624c
 *     bl    func_020362b0
 *     ldmia sp!, {r3, pc}
 */

extern int func_0203624c(int x);
extern int func_020362b0(void);

int func_02036298(int x) {
    if (x == 0) return x;
    func_0203624c(x);
    return func_020362b0();
}
