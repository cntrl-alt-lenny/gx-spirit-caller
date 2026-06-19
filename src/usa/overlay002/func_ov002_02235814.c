/* func_ov002_02235814: brief 236 C-39b — if-then form with 2-helper chain.
 *
 * Orig (0x44):
 *   push {r4, lr}; mov r4, r0
 *   ldrh r1; mov r2, #500; lsl/lsr → bit0; rsb → !bit0
 *   bl helper1(self, !bit0, 500)
 *   cmp #0; beq .fail
 *   ldrh r1 (f0); mov r0, #0; mov r3, r0; mov r2, #1
 *   bl helper2(0, f0, 1, 0)
 *   mov r0, #0; pop
 *   .fail: mov r0, #0; pop
 */

struct F02235904_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02235904_Self {
    unsigned short f0;
    struct F02235904_F2 f2;
};

extern int func_ov002_021df728(struct F02235904_Self *self, unsigned int v, unsigned int k);
extern int func_ov002_021e267c(unsigned int z, unsigned short f0, unsigned int one, unsigned int z2);

int func_ov002_02235814(struct F02235904_Self *self) {
    if (func_ov002_021df728(self, 1 - self->f2.bit0, 500)) {
        func_ov002_021e267c(0, self->f0, 1, 0);
    }
    return 0;
}
