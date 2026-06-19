/* func_ov002_022881fc: brief 230 C-39d — sign-check early-return + bool tail.
 *
 *     bl helper1(bit0); cmp r0, #0; movlt #0; poplt
 *     bl helper2(bit0); cmp r0, #1; movgt #1; movle #0; pop
 *
 * if (helper1(bit0) < 0) return 0; return helper2(bit0) > 1;
 */

struct F0228830c_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F0228830c_Self {
    unsigned short pad0;
    struct F0228830c_F2 f2;
};
extern int func_ov002_02280870(unsigned int bit);
extern int func_ov002_021bbe70(unsigned int bit);

int func_ov002_022881fc(struct F0228830c_Self *self) {
    if (func_ov002_02280870(self->f2.bit0) < 0) return 0;
    return func_ov002_021bbe70(self->f2.bit0) > 1;
}
