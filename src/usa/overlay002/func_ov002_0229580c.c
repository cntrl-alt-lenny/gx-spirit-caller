/* func_ov002_0229580c: brief 227 C-39 wave 2 — two-arg helper, eq-0 bool.
 *
 * Orig (0x24, 9 ARM insns):
 *
 *     push  {r3, lr}
 *     ldrh  r1, [r0, #2]              ; r1 = raw, r0 = self preserved
 *     lsl   r1, r1, #31
 *     lsr   r1, r1, #31              ; r1 = bit0
 *     bl    func_ov002_022579d0       ; helper(self, bit0)
 *     cmp   r0, #0
 *     moveq r0, #1                   ; result == 0 → 1
 *     movne r0, #0
 *     pop   {r3, pc}
 *
 * Brief 222 C-39 bitfield recipe + inverted bool (helper() == 0).
 */

struct F0229591c_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F0229591c_Self {
    unsigned short f0;
    struct F0229591c_F2 f2;
};

extern int func_ov002_022579d0(struct F0229591c_Self *self, unsigned int bit0);

int func_ov002_0229580c(struct F0229591c_Self *self) {
    return func_ov002_022579d0(self, self->f2.bit0) == 0;
}
