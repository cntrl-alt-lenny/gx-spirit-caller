/* func_ov002_021ba9e8: 2-call composition with constant arg
 * 0x14 to second call.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_ov002_021b2094
 *     mov   r0, r4
 *     mov   r1, #0x14
 *     bl    func_ov002_0229cd5c
 *     ldmia sp!, {r4, pc}
 */

extern int func_ov002_021b2094(void *p);
extern int func_ov002_0229cd5c(void *p, int x);

int func_ov002_021ba9e8(void *p) {
    func_ov002_021b2094(p);
    return func_ov002_0229cd5c(p, 0x14);
}
