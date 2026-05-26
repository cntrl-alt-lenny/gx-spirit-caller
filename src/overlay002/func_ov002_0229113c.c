/* func_ov002_0229113c: brief 227 C-39 wave 2 — two-arg helper, signed-gt bool.
 *
 * Orig (0x24, 9 ARM insns):
 *
 *     push  {r3, lr}
 *     ldrh  r1, [r0, #2]              ; r1 = raw, r0 = self preserved
 *     lsl   r1, r1, #31
 *     lsr   r1, r1, #31              ; r1 = bit0
 *     bl    func_ov002_02257ab8       ; helper(self, bit0)
 *     cmp   r0, #0
 *     movgt r0, #1
 *     movle r0, #0
 *     pop   {r3, pc}
 *
 * Brief 222 C-39 bitfield recipe + signed-gt bool (helper() > 0).
 */

struct F0229113c_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F0229113c_Self {
    unsigned short f0;
    struct F0229113c_F2 f2;
};

extern int func_ov002_02257ab8(struct F0229113c_Self *self, unsigned int bit0);

int func_ov002_0229113c(struct F0229113c_Self *self) {
    return func_ov002_02257ab8(self, self->f2.bit0) > 0;
}
