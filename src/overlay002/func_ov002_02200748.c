/* func_ov002_02200748: brief 230 C-39d — helper(bit0, !bit0) early + helper(bit0, f0, 0) > 0.
 *
 *     bl helper1(bit0, 1-bit0); cmp #0; beq .fail
 *     ldrh f0; bl helper2(bit0, f0, 0); cmp #0; movgt #1; movle #0; pop
 *     .fail: mov r0, #0; pop
 */

struct F02200748_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02200748_Self {
    unsigned short f0;
    struct F02200748_F2 f2;
};
extern int func_ov002_021ca698(unsigned int bit, unsigned int notbit);
extern int func_ov002_022536e8(unsigned int bit, unsigned int f0, unsigned int z);

int func_ov002_02200748(struct F02200748_Self *self) {
    if (func_ov002_021ca698(self->f2.bit0, 1 - self->f2.bit0)) {
        return func_ov002_022536e8(self->f2.bit0, self->f0, 0) > 0;
    }
    return 0;
}
