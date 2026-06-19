/* func_ov002_02296390: brief 230 C-39d — eq-check early + helper(bit0) != 0 tail.
 *
 *     bl helper1(1-bit0); cmp #0; moveq #0; popeq
 *     bl helper2(bit0); cmp #0; movne #1; moveq #0; pop
 */

struct F022964a0_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F022964a0_Self {
    unsigned short pad0;
    struct F022964a0_F2 f2;
};
extern int func_ov002_021bbe70(unsigned int v);
extern int func_ov002_02259e8c(unsigned int bit);

int func_ov002_02296390(struct F022964a0_Self *self) {
    if (func_ov002_021bbe70(1 - self->f2.bit0) == 0) return 0;
    return func_ov002_02259e8c(self->f2.bit0) != 0;
}
