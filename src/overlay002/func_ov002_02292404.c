/* func_ov002_02292404: brief 230 C-39d — ne-check early + helper2(bit0, 0) >= 0 tail.
 *
 *     bl helper1(bit0, LIT); cmp #0; movne #0; popne
 *     bl helper2(bit0, 0); cmp #0; movge #1; movlt #0; pop
 *
 * Pool LIT = 0x10bc = 4284.
 */

struct F02292404_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02292404_Self {
    unsigned short pad0;
    struct F02292404_F2 f2;
};
extern int func_ov002_021bbd14(unsigned int bit, unsigned int lit);
extern int func_ov002_0227d660(unsigned int bit, unsigned int z);

int func_ov002_02292404(struct F02292404_Self *self) {
    if (func_ov002_021bbd14(self->f2.bit0, 4284) != 0) return 0;
    return func_ov002_0227d660(self->f2.bit0, 0) >= 0;
}
