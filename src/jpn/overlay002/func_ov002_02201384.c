/* func_ov002_02201384: brief 227 C-39 wave 2 — two-arg helper (self+bit0), bool-from-int.
 *
 * Orig (0x24, 9 ARM insns):
 *
 *     push  {r3, lr}
 *     ldrh  r1, [r0, #2]              ; r1 = raw, r0 = self preserved
 *     lsl   r1, r1, #31
 *     lsr   r1, r1, #31              ; r1 = bit0
 *     bl    func_ov002_021ff1c8       ; helper(self, bit0)
 *     cmp   r0, #0
 *     movne r0, #1
 *     moveq r0, #0
 *     pop   {r3, pc}
 *
 * Brief 222 C-39 bitfield recipe + bool-coercion of helper return.
 * Two-arg variant: self stays in r0 because helper takes (self, bit0).
 */

struct F02201474_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F02201474_Self {
    unsigned short f0;
    struct F02201474_F2 f2;
};

extern int func_ov002_021ff1c8(struct F02201474_Self *self, unsigned int bit0);

int func_ov002_02201384(struct F02201474_Self *self) {
    return func_ov002_021ff1c8(self, self->f2.bit0) != 0;
}
