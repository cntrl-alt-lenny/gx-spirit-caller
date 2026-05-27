/* func_ov002_02296ce8: brief 234 — helper(bit0, fld5) >= 2 (interleaved 2-bitfield).
 *
 *   ldrh r0; lsl r1, r0, #26; lsl r2, r0, #31; lsr r0, r2, #31; lsr r1, r1, #27
 *   bl helper(bit0, fld5); cmp #2; movge #1; movlt #0; pop
 */

struct F02296ce8_F2 {
    unsigned short bit0 : 1;
    unsigned short fld5 : 5;
    unsigned short rest : 10;
};
struct F02296ce8_Self {
    unsigned short pad0;
    struct F02296ce8_F2 f2;
};

extern int func_ov002_021b9bd4(unsigned int bit, unsigned int fld);

int func_ov002_02296ce8(struct F02296ce8_Self *self) {
    return func_ov002_021b9bd4(self->f2.bit0, self->f2.fld5) >= 2;
}
