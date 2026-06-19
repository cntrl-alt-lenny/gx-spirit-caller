/* func_ov002_022076e0: brief 230 C-39d — helper(!bit0)>5 early + helper(bit0)<=5 tail.
 *
 *     bl helper(1-bit0); cmp r0, #5; movgt #0; popgt
 *     bl helper(bit0); cmp r0, #5; movle #1; movgt #0; pop
 *
 * if (helper(1-bit0) > 5) return 0; return helper(bit0) <= 5;
 */

struct F022077d0_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F022077d0_Self {
    unsigned short pad0;
    struct F022077d0_F2 f2;
};
extern int func_ov002_021bbdcc(unsigned int v);

int func_ov002_022076e0(struct F022077d0_Self *self) {
    if (func_ov002_021bbdcc(1 - self->f2.bit0) > 5) return 0;
    return func_ov002_021bbdcc(self->f2.bit0) <= 5;
}
