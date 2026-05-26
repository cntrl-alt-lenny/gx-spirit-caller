/* func_ov002_02295ccc: brief 230 C-39d — sign-check<2 early + helper(bit0) != 0 tail.
 *
 *     bl helper1(1-bit0); cmp r0, #2; movlt #0; poplt
 *     bl helper2(bit0); cmp r0, #0; movne #1; moveq #0; pop
 */

struct F02295ccc_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02295ccc_Self {
    unsigned short pad0;
    struct F02295ccc_F2 f2;
};
extern int func_ov002_021bcf00(unsigned int v);
extern int func_ov002_02259f74(unsigned int bit);

int func_ov002_02295ccc(struct F02295ccc_Self *self) {
    if (func_ov002_021bcf00(1 - self->f2.bit0) < 2) return 0;
    return func_ov002_02259f74(self->f2.bit0) != 0;
}
