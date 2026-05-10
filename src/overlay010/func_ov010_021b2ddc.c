/* func_ov010_021b2ddc: 2-call composition feeding result of 1st
 * into 2nd as r1, with r0=0 and r2=0x800 fixed. Style B.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov010_021b2b80
 *     mov   r1, r0
 *     mov   r0, #0x0
 *     mov   r2, #0x800
 *     bl    func_0209448c
 *     ldmia sp!, {r3, pc}
 */

extern int func_ov010_021b2b80(int x);
extern int func_0209448c(int a, int b, int c);

int func_ov010_021b2ddc(int x) {
    return func_0209448c(0, func_ov010_021b2b80(x), 0x800);
}
