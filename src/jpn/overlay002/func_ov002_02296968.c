/* func_ov002_02296968: brief 230 C-39d — eq-check early + helper(bit0, 1) >= 2 tail.
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
extern int func_ov002_02259e8c(unsigned int bit);
extern int func_ov002_021bc14c(unsigned int bit, unsigned int k);

int func_ov002_02296968(struct F02296a78_Self *self) {
    if (func_ov002_02259e8c(self->f2.bit0) == 0) return 0;
    return func_ov002_021bc14c(self->f2.bit0, 1) >= 2;
}
