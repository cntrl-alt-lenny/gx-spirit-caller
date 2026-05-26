/* func_ov002_02292914: brief 230 wave 4 — helper(1-bit0, 1, 0) > 0 (single-bl variant).
 *
 *     push {r3, lr}
 *     ldrh r0; mov r1, #1; mov r2, #0
 *     lsl/lsr → bit0; rsb → 1-bit0
 *     bl helper(1-bit0, 1, 0); cmp #0; movgt #1; movle #0; pop
 *
 * Brief 228 leftover — V11 variant (3-arg with literal 1+0).
 */

struct F02292914_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02292914_Self {
    unsigned short pad0;
    struct F02292914_F2 f2;
};
extern int func_ov002_021bc0d4(unsigned int v, unsigned int k1, unsigned int z);

int func_ov002_02292914(struct F02292914_Self *self) {
    return func_ov002_021bc0d4(1 - self->f2.bit0, 1, 0) > 0;
}
