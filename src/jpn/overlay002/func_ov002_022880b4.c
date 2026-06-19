/* func_ov002_022880b4: brief 230 C-39d — helper(1-bit0, 11, f0) ne early + helper(bit0) < 0.
 *
 *     bl helper1(!bit0, 11, f0); cmp #0; movne #0; popne
 *     bl helper2(bit0); cmp #0; movlt #1; movge #0; pop
 */

struct F022881c4_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F022881c4_Self {
    unsigned short f0;
    struct F022881c4_F2 f2;
};
extern int func_ov002_021b3dec(unsigned int v, unsigned int k, unsigned int f0);
extern int func_ov002_02280870(unsigned int bit);

int func_ov002_022880b4(struct F022881c4_Self *self) {
    if (func_ov002_021b3dec(1 - self->f2.bit0, 11, self->f0) != 0) return 0;
    return func_ov002_02280870(self->f2.bit0) < 0;
}
