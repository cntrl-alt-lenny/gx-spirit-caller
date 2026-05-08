/* func_0200a9dc: 2-call helper with constant args.
 *
 *     stmdb sp!, {r3, lr}
 *     mov   r0, #0x1
 *     bl    func_02034bd8
 *     mov   r0, #0x0
 *     bl    func_02005878
 *     ldmia sp!, {r3, pc}
 */

extern int func_02034bd8(int x);
extern int func_02005878(int x);

int func_0200a9dc(void) {
    func_02034bd8(1);
    return func_02005878(0);
}
