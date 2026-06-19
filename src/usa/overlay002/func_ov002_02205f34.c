/* func_ov002_02205f34: brief 230 — single-bl helper(bit0, fld5) != 0 (interleaved 2-bitfield).
 *
 *     push {r3, lr}; ldrh r0; lsl r1, r0, #26; lsl r2, r0, #31; lsr r0; lsr r1
 *     bl helper(bit0, fld5); cmp #0; movne #1; moveq #0; pop
 */

struct F02206024_F2 {
    unsigned short bit0 : 1;
    unsigned short fld5 : 5;
    unsigned short rest : 10;
};
struct F02206024_Self {
    unsigned short pad0;
    struct F02206024_F2 f2;
};
extern int func_ov002_021c22cc(unsigned int bit, unsigned int fld);

int func_ov002_02205f34(struct F02206024_Self *self) {
    return func_ov002_021c22cc(self->f2.bit0, self->f2.fld5) != 0;
}
