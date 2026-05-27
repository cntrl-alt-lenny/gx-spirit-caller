/* func_ov002_021f8530: brief 236 — helper1(self); helper2(bit0, 1, 0, 1); return 1.
 *
 *   push {r4, lr}; mov r4, r0
 *   bl helper1(self)
 *   ldrh r0, [r4, #2]; mov r1, #1; mov r3, r1 (=1); lsl/lsr → bit0; mov r2, #0
 *   bl helper2(bit0, 1, 0, 1)
 *   mov r0, #1; pop
 */

struct F021f8530_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F021f8530_Self {
    unsigned short pad0;
    struct F021f8530_F2 f2;
};

extern int func_ov002_021f4a4c(struct F021f8530_Self *self);
extern int func_ov002_0226ae30(unsigned int bit, unsigned int one, unsigned int z, unsigned int one2);

int func_ov002_021f8530(struct F021f8530_Self *self) {
    func_ov002_021f4a4c(self);
    func_ov002_0226ae30(self->f2.bit0, 1, 0, 1);
    return 1;
}
