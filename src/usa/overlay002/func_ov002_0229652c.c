/* func_ov002_0229652c: brief 230 C-39d — helper1(self, !bit0, 1) != 0 → 1; helper2(self, !bit0) > 1.
 *
 *     bl helper1(self, 1-bit0, 1); cmp #0; movne #1; popne
 *     bl helper2(self, 1-bit0); cmp #1; movgt #1; movle #0; pop
 */

struct F0229663c_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F0229663c_Self {
    unsigned short pad0;
    struct F0229663c_F2 f2;
};
extern int func_ov002_02281650(struct F0229663c_Self *self, unsigned int v, unsigned int k);
extern int func_ov002_022579d0(struct F0229663c_Self *self, unsigned int v);

int func_ov002_0229652c(struct F0229663c_Self *self) {
    if (func_ov002_02281650(self, 1 - self->f2.bit0, 1) != 0) return 1;
    return func_ov002_022579d0(self, 1 - self->f2.bit0) > 1;
}
