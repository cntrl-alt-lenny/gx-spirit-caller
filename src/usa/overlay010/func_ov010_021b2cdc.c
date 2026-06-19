/* func_ov010_021b2cdc: 2-call composition feeding result of 1st
 * into 2nd as r1, with r0=0 and r2=0x800 fixed. Style B.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov010_021b2a80
 *     mov   r1, r0
 *     mov   r0, #0x0
 *     mov   r2, #0x800
 *     bl    func_02094398
 *     ldmia sp!, {r3, pc}
 */

extern int func_ov010_021b2a80(int x);
extern int func_02094398(int a, int b, int c);

int func_ov010_021b2cdc(int x) {
    return func_02094398(0, func_ov010_021b2a80(x), 0x800);
}
