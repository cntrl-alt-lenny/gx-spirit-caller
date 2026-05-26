/* func_ov002_02206fb4: brief 230 wave 4 — helper(bit0, 11, f0, 2) == 0.
 *
 *     push {r3, lr}; ldrh r3; ldrh r2 (f0); mov r1, #11
 *     lsl/lsr → bit0; mov r3, #2; bl helper(bit0, 11, f0, 2)
 *     cmp #0; moveq #1; movne #0; pop
 *
 * Brief 228 leftover — V8-extended (4-arg with 2 literals).
 */

struct F02206fb4_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02206fb4_Self {
    unsigned short f0;
    struct F02206fb4_F2 f2;
};
extern int func_ov002_021b4054(unsigned int bit, unsigned int k1, unsigned int f0, unsigned int k2);

int func_ov002_02206fb4(struct F02206fb4_Self *self) {
    return func_ov002_021b4054(self->f2.bit0, 11, self->f0, 2) == 0;
}
