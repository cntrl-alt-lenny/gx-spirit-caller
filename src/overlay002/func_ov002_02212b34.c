/* func_ov002_02212b34: brief 234 — helper(1-bit0, 2); return 0 (brief 228 V9a sibling).
 *
 *   ldrh r0; mov r1, #2; lsl/lsr → bit0; rsb r0, r0, #1 → !bit0
 *   bl helper(!bit0, 2); mov r0, #0; pop
 */

struct F02212b34_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02212b34_Self {
    unsigned short pad0;
    struct F02212b34_F2 f2;
};

extern int func_ov002_021e104c(unsigned int v, unsigned int k);

int func_ov002_02212b34(struct F02212b34_Self *self) {
    func_ov002_021e104c(1 - self->f2.bit0, 2);
    return 0;
}
