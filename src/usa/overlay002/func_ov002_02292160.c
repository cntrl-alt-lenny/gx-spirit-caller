/* func_ov002_02292160: brief 230 C-39d — helper(bit0, 11, f0) ne early + helper(self, bit0) > 6.
 *
 *     bl helper1(bit0, 11, f0); cmp #0; movne #0; popne
 *     bl helper2(self, bit0); cmp #6; movgt #1; movle #0; pop
 *
 * Note: no `rsb` before helper1 — uses bit0 directly (not !bit0).
 */

struct F02292270_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02292270_Self {
    unsigned short f0;
    struct F02292270_F2 f2;
};
extern int func_ov002_021b3dec(unsigned int bit, unsigned int k, unsigned int f0);
extern int func_ov002_021ff1d8(struct F02292270_Self *self, unsigned int bit);

int func_ov002_02292160(struct F02292270_Self *self) {
    if (func_ov002_021b3dec(self->f2.bit0, 11, self->f0) != 0) return 0;
    return func_ov002_021ff1d8(self, self->f2.bit0) > 6;
}
