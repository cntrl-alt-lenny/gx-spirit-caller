/* func_02092e1c: 2-bl arg-preserving thunk (W-E / C-12). Calls
 * func_02092e30(x) then func_02092ec0() and returns x.
 *
 *     stmdb sp!, {r0, lr}
 *     bl    func_02092e30
 *     bl    func_02092ec0
 *     ldmia sp!, {r0, lr}
 *     bx    lr
 *
 * Same C-12 inline-asm recipe as func_020931ac. Default `.c`
 * routing (mwcc 2.0/sp1p5).
 */

extern void func_02092e30(int x);
extern void func_02092ec0(void);

asm void func_02092e1c(int x) {
    nofralloc
    stmdb sp!, {r0, lr}
    bl    func_02092e30
    bl    func_02092ec0
    ldmia sp!, {r0, lr}
    bx    lr
}
