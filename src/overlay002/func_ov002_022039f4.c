/* func_ov002_022039f4: brief 230 C-39d — eq-check early + helper(bit0, f0, 0) != 0 tail.
 *
 *     bl helper1(bit0); cmp #0; moveq #0; popeq
 *     ldrh r1, [r4]; mov r2, #0; ldrh r0; lsl/lsr → bit0
 *     bl helper2(bit0, f0, 0); cmp #0; movne #1; moveq #0; pop
 */

struct F022039f4_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F022039f4_Self {
    unsigned short f0;
    struct F022039f4_F2 f2;
};
extern int func_ov002_021ca2b8(unsigned int bit);
extern int func_ov002_022536e8(unsigned int bit, unsigned int f0, unsigned int z);

int func_ov002_022039f4(struct F022039f4_Self *self) {
    if (func_ov002_021ca2b8(self->f2.bit0) == 0) return 0;
    return func_ov002_022536e8(self->f2.bit0, self->f0, 0) != 0;
}
