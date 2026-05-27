/* func_ov002_022070e4: brief 234 C-39b — 2 null-checks + bool tail (E5 chain).
 *
 * Orig (0x60):
 *   bl helper1(self); cmp #0; moveq #0; popeq
 *   ldrh; bit0; mov r1, r0; bl helper2(bit0, bit0); cmp #0; moveq #0; popeq
 *   ldrh; ldrh f0; mov r2, #0; bit0; bl helper3(bit0, f0, 0)
 *   cmp #2; movge #1; movlt #0; pop
 */

struct F022070e4_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F022070e4_Self {
    unsigned short f0;
    struct F022070e4_F2 f2;
};

extern int func_ov002_021ff320(struct F022070e4_Self *self);
extern int func_ov002_021ca698(unsigned int a, unsigned int b);
extern int func_ov002_022536e8(unsigned int bit, unsigned short f0, unsigned int z);

int func_ov002_022070e4(struct F022070e4_Self *self) {
    if (func_ov002_021ff320(self) == 0) return 0;
    if (func_ov002_021ca698(self->f2.bit0, self->f2.bit0) == 0) return 0;
    return func_ov002_022536e8(self->f2.bit0, self->f0, 0) >= 2;
}
