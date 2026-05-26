/* func_ov002_02295bc0: brief 230 C-39d — helper(bit0)==0 early + helper(bit0, fld5, 1) != 0.
 *
 *     bl helper1(bit0); cmp #0; moveq #0; popeq
 *     ldrh r0; mov r2, #1; lsl r1, r0, #26; lsl r3, r0, #31; lsr r0, r3, #31; lsr r1, r1, #27
 *     bl helper2(bit0, fld5, 1); cmp #0; movne #1; moveq #0; pop
 */

struct F02295bc0_F2 {
    unsigned short bit0 : 1;
    unsigned short fld5 : 5;
    unsigned short rest : 10;
};
struct F02295bc0_Self {
    unsigned short pad0;
    struct F02295bc0_F2 f2;
};
extern int func_ov002_02259f74(unsigned int bit);
extern int func_ov002_021be4a0(unsigned int bit, unsigned int fld, unsigned int k);

int func_ov002_02295bc0(struct F02295bc0_Self *self) {
    if (func_ov002_02259f74(self->f2.bit0) == 0) return 0;
    return func_ov002_021be4a0(self->f2.bit0, self->f2.fld5, 1) != 0;
}
