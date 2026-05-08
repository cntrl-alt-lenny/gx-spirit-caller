/* func_02092f04: 2-bl arg-preserving thunk (W-E / C-12). Calls
 * func_02092f18(x) then func_02092fa8() and returns x.
 *
 *     stmdb sp!, {r0, lr}
 *     bl    func_02092f18
 *     bl    func_02092fa8
 *     ldmia sp!, {r0, lr}
 *     bx    lr
 *
 * Same C-12 inline-asm recipe as func_02093294. Default `.c`
 * routing (mwcc 2.0/sp1p5).
 */

extern void func_02092f18(int x);
extern void func_02092fa8(void);

asm void func_02092f04(int x) {
    nofralloc
    stmdb sp!, {r0, lr}
    bl    func_02092f18
    bl    func_02092fa8
    ldmia sp!, {r0, lr}
    bx    lr
}
