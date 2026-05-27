/* func_ov002_021f8214: brief 234 — int n = helper1(self); helper2(bit0, fld5, -n); return 1.
 *
 *   push {r4, lr}; mov r4, r0
 *   bl helper1(self)
 *   ldrh r1, [r4, #2]; rsb r2, r0, #0 (= -n)
 *   lsl r0, r1, #31; lsl r1, r1, #26; lsr r0; lsr r1 (multi-bitfield)
 *   bl helper2(bit0, fld5, -n); mov r0, #1; pop
 */

struct F021f8214_F2 {
    unsigned short bit0 : 1;
    unsigned short fld5 : 5;
    unsigned short rest : 10;
};
struct F021f8214_Self {
    unsigned short pad0;
    struct F021f8214_F2 f2;
};

extern int func_ov002_021f4194(struct F021f8214_Self *self);
extern int func_ov002_021d91e0(unsigned int bit, unsigned int fld, int negn);

int func_ov002_021f8214(struct F021f8214_Self *self) {
    int n = func_ov002_021f4194(self);
    func_ov002_021d91e0(self->f2.bit0, self->f2.fld5, -n);
    return 1;
}
