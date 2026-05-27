/* func_ov002_021fbe90: brief 236 — helper1(bit0, f0, 1, 0); return helper2(self, arg1).
 *
 *   push {r3, r4, r5, lr}; mov r5, r0
 *   ldrh r0 (f2); mov r4, r1; ldrh r1 (f0); lsl/lsr → bit0; mov r2, #1; mov r3, #0
 *   bl helper1(bit0, f0, 1, 0)
 *   mov r0, r5; mov r1, r4; bl helper2(self, arg1)
 *   pop
 */

struct F021fbe90_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F021fbe90_Self {
    unsigned short f0;
    struct F021fbe90_F2 f2;
};

extern int func_ov002_021e276c(unsigned int bit, unsigned short f0, unsigned int one, unsigned int z);
extern int func_ov002_021f49d0(struct F021fbe90_Self *self, void *arg1);

int func_ov002_021fbe90(struct F021fbe90_Self *self, void *arg1) {
    func_ov002_021e276c(self->f2.bit0, self->f0, 1, 0);
    return func_ov002_021f49d0(self, arg1);
}
