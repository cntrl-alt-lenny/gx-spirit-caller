/* func_020139e4: thin 2-call helper. Calls func_020139c4(arg),
 * then returns func_0201913c(arg << 4). Style B.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_020139c4
 *     mov   r0, r4, lsl #0x4
 *     bl    func_0201913c
 *     ldmia sp!, {r4, pc}
 */

extern void func_020139c4(int x);
extern int  func_0201913c(int x);

int func_020139e4(int x) {
    func_020139c4(x);
    return func_0201913c(x << 4);
}
