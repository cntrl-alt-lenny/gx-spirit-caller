/* func_ov002_022930a8: brief 230 C-39d — gt-check early-return + bool tail.
 *
 *     bl helper1(bit0); cmp r0, #0; movgt #0; popgt
 *     bl helper2(bit0); cmp r0, #1; movgt #1; movle #0; pop
 *
 * if (helper1(bit0) > 0) return 0; return helper2(bit0) > 1;
 */

struct F022930a8_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F022930a8_Self {
    unsigned short pad0;
    struct F022930a8_F2 f2;
};
extern int func_ov002_02280980(unsigned int bit);
extern int func_ov002_021bbf50(unsigned int bit);

int func_ov002_022930a8(struct F022930a8_Self *self) {
    if (func_ov002_02280980(self->f2.bit0) > 0) return 0;
    return func_ov002_021bbf50(self->f2.bit0) > 1;
}
