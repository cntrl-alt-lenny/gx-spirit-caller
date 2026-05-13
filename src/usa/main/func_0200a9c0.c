/* func_0200a9c0: 2-call helper with constant args.
 *
 *     stmdb sp!, {r3, lr}
 *     mov   r0, #0x1
 *     bl    func_02034b88
 *     mov   r0, #0x0
 *     bl    func_0200585c
 *     ldmia sp!, {r3, pc}
 */

extern int func_02034b88(int x);
extern int func_0200585c(int x);

int func_0200a9c0(void) {
    func_02034b88(1);
    return func_0200585c(0);
}
