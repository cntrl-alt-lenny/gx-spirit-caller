/* func_ov002_022913a8: brief 227 C-39 wave 2 — single-arg helper, signed-gt bool.
 *
 * Orig (0x24, 9 ARM insns):
 *
 *     push  {r3, lr}
 *     ldrh  r0, [r0, #2]
 *     lsl   r0, r0, #31
 *     lsr   r0, r0, #31              ; bit0 extract
 *     bl    func_ov002_02280980
 *     cmp   r0, #0
 *     movgt r0, #1
 *     movle r0, #0
 *     pop   {r3, pc}
 *
 * Brief 222 C-39 bitfield recipe + signed-gt bool (helper() > 0).
 */

struct F022913a8_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F022913a8_Self {
    unsigned short f0;
    struct F022913a8_F2 f2;
};

extern int func_ov002_02280980(unsigned int bit0);

int func_ov002_022913a8(struct F022913a8_Self *self) {
    return func_ov002_02280980(self->f2.bit0) > 0;
}
