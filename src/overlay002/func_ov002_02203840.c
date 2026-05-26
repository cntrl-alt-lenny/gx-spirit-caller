/* func_ov002_02203840: brief 227 C-39 wave 2 — single-arg helper, signed-ge bool.
 *
 * Orig (0x24, 9 ARM insns):
 *
 *     push  {r3, lr}
 *     ldrh  r0, [r0, #2]
 *     lsl   r0, r0, #31
 *     lsr   r0, r0, #31              ; bit0 extract
 *     bl    func_ov002_021bd030
 *     cmp   r0, #0
 *     movge r0, #1                   ; signed: result >= 0 → 1
 *     movlt r0, #0
 *     pop   {r3, pc}
 *
 * Brief 222 C-39 bitfield recipe + signed-ge bool (helper() >= 0).
 */

struct F02203840_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F02203840_Self {
    unsigned short f0;
    struct F02203840_F2 f2;
};

extern int func_ov002_021bd030(unsigned int bit0);

int func_ov002_02203840(struct F02203840_Self *self) {
    return func_ov002_021bd030(self->f2.bit0) >= 0;
}
