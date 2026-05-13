/* func_ov002_021ba908: 2-call composition with constant arg
 * 0x14 to second call.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_ov002_021b1fb4
 *     mov   r0, r4
 *     mov   r1, #0x14
 *     bl    func_ov002_0229cc4c
 *     ldmia sp!, {r4, pc}
 */

extern int func_ov002_021b1fb4(void *p);
extern int func_ov002_0229cc4c(void *p, int x);

int func_ov002_021ba908(void *p) {
    func_ov002_021b1fb4(p);
    return func_ov002_0229cc4c(p, 0x14);
}
