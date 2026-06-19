/* func_ov002_02287100: brief 236 — if-then null-check + tail-call helper(!bit0).
 *
 *   push {r4, lr}; mov r4, r0
 *   bl helper0(self); cmp #0; moveq #0; popeq
 *   ldrh r0; lsl/lsr → bit0; rsb → !bit0
 *   bl helper(!bit0)            ; tail-call (no mov r0, #N after)
 *   pop
 */

struct F02287210_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02287210_Self {
    unsigned short pad0;
    struct F02287210_F2 f2;
};

extern int func_ov002_02286868(struct F02287210_Self *self);
extern int func_ov002_021c3270(unsigned int v);

int func_ov002_02287100(struct F02287210_Self *self) {
    if (func_ov002_02286868(self) == 0) return 0;
    return func_ov002_021c3270(1 - self->f2.bit0);
}
