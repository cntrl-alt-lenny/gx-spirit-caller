/* func_ov002_02294584: brief 230 C-39d — if(helper1) return helper2(bit0,1,1)>0; else 0.
 *
 *     bl helper1(bit0); cmp #0; beq .fail
 *     ldrh; mov r1, #1; mov r2, r1; lsl/lsr → bit0; bl helper2(bit0, 1, 1)
 *     cmp #0; movgt #1; movle #0; pop
 *     .fail: mov r0, #0; pop
 */

struct F02294694_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02294694_Self {
    unsigned short pad0;
    struct F02294694_F2 f2;
};
extern int func_ov002_02259e8c(unsigned int bit);
extern int func_ov002_021bbff4(unsigned int bit, unsigned int k1, unsigned int k2);

int func_ov002_02294584(struct F02294694_Self *self) {
    if (func_ov002_02259e8c(self->f2.bit0)) {
        return func_ov002_021bbff4(self->f2.bit0, 1, 1) > 0;
    }
    return 0;
}
