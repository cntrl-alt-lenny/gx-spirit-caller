/* func_020139b0: thin 2-call helper. Calls func_02013990(arg),
 * then returns func_02019108(arg << 4). Style B.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_02013990
 *     mov   r0, r4, lsl #0x4
 *     bl    func_02019108
 *     ldmia sp!, {r4, pc}
 */

extern void func_02013990(int x);
extern int  func_02019108(int x);

int func_020139b0(int x) {
    func_02013990(x);
    return func_02019108(x << 4);
}
