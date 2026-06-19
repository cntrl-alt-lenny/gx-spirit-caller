/* func_ov002_02292834: brief 230 C-39d — helper(bit0)==0 early + helper(!bit0, 1, 0) > 0.
 *
 *     bl helper1(bit0); cmp #0; beq .fail
 *     bl helper2(!bit0, 1, 0); cmp #0; movgt #1; movle #0; pop
 *     .fail: mov r0, #0; pop
 */

struct F02292944_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02292944_Self {
    unsigned short pad0;
    struct F02292944_F2 f2;
};
extern int func_ov002_02281964(unsigned int bit);
extern int func_ov002_021bbff4(unsigned int v, unsigned int k, unsigned int z);

int func_ov002_02292834(struct F02292944_Self *self) {
    if (func_ov002_02281964(self->f2.bit0)) {
        return func_ov002_021bbff4(1 - self->f2.bit0, 1, 0) > 0;
    }
    return 0;
}
