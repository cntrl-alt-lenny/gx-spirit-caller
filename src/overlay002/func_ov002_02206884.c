/* func_ov002_02206884: C-39b sign-check + bool tail.
 *
 * Orig (56 B):
 *   stmdb sp!, {r4, lr}
 *   mov   r4, r0
 *   bl    func_ov002_021ff354       ; helper1(self)
 *   cmp   r0, #0x0
 *   moveq r0, #0x0
 *   ldmeqia sp!, {r4, pc}            ; early-return 0 if == 0
 *   ldrh  r0, [r4, #0x2]
 *   ldrh  r1, [r4, #0x0]              ; r1 = f0
 *   mov   r2, #0x0
 *   mov   r0, r0, lsl #0x1f
 *   mov   r0, r0, lsr #0x1f           ; r0 = bit0
 *   bl    func_ov002_022536e8        ; helper2(bit0, f0, 0)
 *   cmp   r0, #0x0
 *   movne r0, #0x1
 *   moveq r0, #0x0
 *   pop   {r4, pc}
 */

struct F02206884_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02206884_Self {
    unsigned short f0;
    struct F02206884_F2 f2;
};

extern int func_ov002_021ff354(struct F02206884_Self *self);
extern int func_ov002_022536e8(unsigned int bit, unsigned short f0, int zero);

int func_ov002_02206884(struct F02206884_Self *self) {
    if (func_ov002_021ff354(self) == 0) return 0;
    return func_ov002_022536e8(self->f2.bit0, self->f0, 0) != 0;
}
