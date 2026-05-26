/* func_ov002_02296a78: brief 230 C-39d — eq-check early + helper(bit0, 1) >= 2 tail.
 *
 *     bl helper1(bit0); cmp #0; moveq #0; popeq
 *     bl helper2(bit0, 1); cmp #2; movge #1; movlt #0; pop
 */

struct F02296a78_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02296a78_Self {
    unsigned short pad0;
    struct F02296a78_F2 f2;
};
extern int func_ov002_02259f74(unsigned int bit);
extern int func_ov002_021bc22c(unsigned int bit, unsigned int k);

int func_ov002_02296a78(struct F02296a78_Self *self) {
    if (func_ov002_02259f74(self->f2.bit0) == 0) return 0;
    return func_ov002_021bc22c(self->f2.bit0, 1) >= 2;
}
