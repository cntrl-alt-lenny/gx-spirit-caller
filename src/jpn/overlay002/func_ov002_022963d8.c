/* func_ov002_022963d8: brief 230 C-39d — helper1(bit0)<0 → 1; helper2(self, !bit0, 0) != 0.
 *
 *     bl helper1(bit0); cmp #0; movlt #1; poplt
 *     bl helper2(self, !bit0, 0); cmp #0; movne #1; moveq #0; pop
 */

struct F022964e8_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F022964e8_Self {
    unsigned short pad0;
    struct F022964e8_F2 f2;
};
extern int func_ov002_02280870(unsigned int bit);
extern int func_ov002_02281650(struct F022964e8_Self *self, unsigned int v, unsigned int z);

int func_ov002_022963d8(struct F022964e8_Self *self) {
    if (func_ov002_02280870(self->f2.bit0) < 0) return 1;
    return func_ov002_02281650(self, 1 - self->f2.bit0, 0) != 0;
}
