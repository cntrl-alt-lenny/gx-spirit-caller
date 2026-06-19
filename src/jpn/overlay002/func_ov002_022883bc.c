/* func_ov002_022883bc: brief 230 C-39d — if(helper1(bit0,10,LIT)) return helper2(bit0,10)<4; else 0.
 *
 *     bl helper1(bit0, 10, 0x1a0c); cmp #0; beq .fail
 *     bl helper2(bit0, 10); cmp #4; movlt #1; movge #0; pop
 *     .fail: mov r0, #0; pop
 *
 * Pool LIT = 0x1a0c = 6668.
 */

struct F022884cc_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F022884cc_Self {
    unsigned short pad0;
    struct F022884cc_F2 f2;
};
extern int func_ov002_021babc8(unsigned int bit, unsigned int k, unsigned int lit);
extern int func_ov002_021b9d68(unsigned int bit, unsigned int k);

int func_ov002_022883bc(struct F022884cc_Self *self) {
    if (func_ov002_021babc8(self->f2.bit0, 10, 6668)) {
        return func_ov002_021b9d68(self->f2.bit0, 10) < 4;
    }
    return 0;
}
