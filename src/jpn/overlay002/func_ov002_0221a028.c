/* func_ov002_0221a028: brief 234 — helper(1-bit0, 0, 1); return 0.
 *
 *   ldrh r0; mov r1, #0; mov r2, #1; lsl/lsr; rsb r0, r0, #1
 *   bl helper(1-bit0, 0, 1); mov r0, #0; pop
 */

struct F0221a118_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F0221a118_Self {
    unsigned short pad0;
    struct F0221a118_F2 f2;
};

extern int func_ov002_021e2c30(unsigned int v, unsigned int z, unsigned int one);

int func_ov002_0221a028(struct F0221a118_Self *self) {
    func_ov002_021e2c30(1 - self->f2.bit0, 0, 1);
    return 0;
}
