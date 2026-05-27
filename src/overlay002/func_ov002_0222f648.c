/* func_ov002_0222f648: brief 236 — helper1(self); helper2(bit0, fld5, f0, 1); return 0.
 *
 *   push {r4, lr}; mov r4, r0
 *   bl helper1(self)
 *   ldrh r0 (f2); ldrh r2 (f0); mov r3, #1
 *   lsl ip, r0, #31; lsl r1, r0, #26; lsr r0; lsr r1
 *   bl helper2(bit0, fld5, f0, 1)
 *   mov r0, #0; pop
 */

struct F0222f648_F2 {
    unsigned short bit0 : 1;
    unsigned short fld5 : 5;
    unsigned short rest : 10;
};
struct F0222f648_Self {
    unsigned short f0;
    struct F0222f648_F2 f2;
};

extern int func_ov002_02210104(struct F0222f648_Self *self);
extern int func_ov002_021d5b80(unsigned int bit, unsigned int fld, unsigned short f0, unsigned int one);

int func_ov002_0222f648(struct F0222f648_Self *self) {
    func_ov002_02210104(self);
    func_ov002_021d5b80(self->f2.bit0, self->f2.fld5, self->f0, 1);
    return 0;
}
