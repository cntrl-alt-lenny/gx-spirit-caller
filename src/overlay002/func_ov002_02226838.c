/* func_ov002_02226838: brief 234 — helper(1-bit0, 1, 1); return 0.
 *
 *   ldrh r0; mov r1, #1; mov r2, r1 (=1); lsl/lsr; rsb r0, r0, #1
 *   bl helper(1-bit0, 1, 1); mov r0, #0; pop
 */

struct F02226838_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02226838_Self {
    unsigned short pad0;
    struct F02226838_F2 f2;
};

extern int func_ov002_021e13f4(unsigned int v, unsigned int one, unsigned int one2);

int func_ov002_02226838(struct F02226838_Self *self) {
    func_ov002_021e13f4(1 - self->f2.bit0, 1, 1);
    return 0;
}
