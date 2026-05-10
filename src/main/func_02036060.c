/* func_02036060: 3-call sandwich. Calls func_020955a8() to get
 * a saved value, then func_02095678(1) (intermediate), then
 * func_020955e8(saved). Returns last call's result.
 *
 *     stmdb sp!, {r4, lr}
 *     bl    func_020955a8
 *     mov   r4, r0
 *     mov   r0, #0x1
 *     bl    func_02095678
 *     mov   r0, r4
 *     bl    func_020955e8
 *     ldmia sp!, {r4, pc}
 */

extern int func_020955a8(void);
extern int func_02095678(int x);
extern int func_020955e8(int x);

int func_02036060(void) {
    int saved = func_020955a8();
    func_02095678(1);
    return func_020955e8(saved);
}
