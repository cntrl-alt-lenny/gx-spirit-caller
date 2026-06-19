/* func_ov002_02287bc0: brief 227 C-39 wave 2 — single-arg helper, inverted bool.
 *
 * Orig (0x24, 9 ARM insns):
 *
 *     push  {r3, lr}
 *     ldrh  r0, [r0, #2]
 *     lsl   r0, r0, #31
 *     lsr   r0, r0, #31              ; bit0 extract
 *     bl    func_ov002_021bbe70
 *     cmp   r0, #0
 *     moveq r0, #1                   ; INVERTED: result == 0 → 1
 *     movne r0, #0
 *     pop   {r3, pc}
 *
 * Brief 222 C-39 bitfield recipe + inverted bool (helper() == 0).
 */

struct F02287cd0_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F02287cd0_Self {
    unsigned short f0;
    struct F02287cd0_F2 f2;
};

extern int func_ov002_021bbe70(unsigned int bit0);

int func_ov002_02287bc0(struct F02287cd0_Self *self) {
    return func_ov002_021bbe70(self->f2.bit0) == 0;
}
