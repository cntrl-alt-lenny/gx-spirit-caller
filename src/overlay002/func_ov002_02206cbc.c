/* func_ov002_02206cbc: brief 230 C-39d — helper(bit0, lit1) ne early + helper(bit0, lit2) != 0.
 *
 *     bl helper(bit0, 0x167a); cmp #0; movne #1; popne (early-return 1 if true)
 *     bl helper(bit0, 0x167b); cmp #0; movne #1; moveq #0; pop
 *
 * Pool literals: 0x167a = 5754, 0x167b = 5755.
 */

struct F02206cbc_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02206cbc_Self {
    unsigned short pad0;
    struct F02206cbc_F2 f2;
};
extern int func_ov002_021c2f24(unsigned int bit, unsigned int code);

int func_ov002_02206cbc(struct F02206cbc_Self *self) {
    if (func_ov002_021c2f24(self->f2.bit0, 0x167a) != 0) return 1;
    return func_ov002_021c2f24(self->f2.bit0, 0x167b) != 0;
}
