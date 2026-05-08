/* func_ov002_021b00d0: fixed-point multiply-by-call-result.
 * Returns (arg0 * func_ov002_021b009c()) >> 15. Style B.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_ov002_021b009c
 *     mul   r0, r4, r0
 *     mov   r0, r0, lsr #0xf
 *     ldmia sp!, {r4, pc}
 */

extern unsigned int func_ov002_021b009c(void);

unsigned int func_ov002_021b00d0(unsigned int x) {
    return (x * func_ov002_021b009c()) >> 15;
}
