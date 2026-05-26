/* func_ov002_02203864: brief 230 C-39d — eq-check early + helper2(bit0, fld5) tail.
 *
 *     bl helper1(bit0); cmp #0; moveq #0; popeq
 *     ldrh r0; lsl r1, r0, #26; lsl r2, r0, #31; lsr r0, r2, #31; lsr r1, r1, #27
 *     bl helper2(bit0, fld5); cmp #0; movne #1; moveq #0; pop
 *
 * Multi-bitfield: bit0 (bit 0) + fld5 (5 bits starting at bit 1).
 */

struct F02203864_F2 {
    unsigned short bit0 : 1;
    unsigned short fld5 : 5;
    unsigned short rest : 10;
};
struct F02203864_Self {
    unsigned short pad0;
    struct F02203864_F2 f2;
};
extern int func_ov002_021ca2b8(unsigned int bit);
extern int func_ov002_021c23ac(unsigned int bit, unsigned int fld);

int func_ov002_02203864(struct F02203864_Self *self) {
    if (func_ov002_021ca2b8(self->f2.bit0) == 0) return 0;
    return func_ov002_021c23ac(self->f2.bit0, self->f2.fld5) != 0;
}
