/* func_ov002_0228ac50: brief 227 C-39 wave 2 — single-arg helper, gt-2 threshold bool.
 *
 * Orig (0x24, 9 ARM insns):
 *
 *     push  {r3, lr}
 *     ldrh  r0, [r0, #2]
 *     lsl   r0, r0, #31
 *     lsr   r0, r0, #31              ; bit0 extract
 *     bl    func_ov002_021bbf50
 *     cmp   r0, #2
 *     movgt r0, #1                   ; signed: result > 2 → 1
 *     movle r0, #0
 *     pop   {r3, pc}
 *
 * Brief 222 C-39 bitfield recipe + gt-2 threshold bool (helper() > 2).
 */

struct F0228ac50_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F0228ac50_Self {
    unsigned short f0;
    struct F0228ac50_F2 f2;
};

extern int func_ov002_021bbf50(unsigned int bit0);

int func_ov002_0228ac50(struct F0228ac50_Self *self) {
    return func_ov002_021bbf50(self->f2.bit0) > 2;
}
