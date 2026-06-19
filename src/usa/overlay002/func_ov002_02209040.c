/* func_ov002_02209040: brief 230 wave 4 — helper(bit0, fld5, f0) != 0 (2-bitfield interleaved).
 *
 *     push {r3, lr}; ldrh r1 (raw); ldrh r2 (f0)
 *     lsl r0, r1, #31; lsl r1, r1, #26; lsr r0, r0, #31; lsr r1, r1, #27
 *     bl helper(bit0, fld5, f0); cmp #0; movne #1; moveq #0; pop
 */

struct F02209130_F2 {
    unsigned short bit0 : 1;
    unsigned short fld5 : 5;
    unsigned short rest : 10;
};
struct F02209130_Self {
    unsigned short f0;
    struct F02209130_F2 f2;
};
extern int func_ov002_021b3dec(unsigned int bit, unsigned int fld, unsigned int f0);

int func_ov002_02209040(struct F02209130_Self *self) {
    return func_ov002_021b3dec(self->f2.bit0, self->f2.fld5, self->f0) != 0;
}
