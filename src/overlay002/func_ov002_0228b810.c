/* func_ov002_0228b810: C-39b null-check + helper-check + tail-call.
 *
 * Orig (56 B):
 *   stmdb sp!, {r3, r4, r5, lr}
 *   movs  r4, r1                     ; r4 = arg1, set flags
 *   mov   r5, r0                     ; r5 = self
 *   moveq r0, #0x0
 *   ldmeqia sp!, {r3, r4, r5, pc}   ; early-return 0 if arg1 == 0
 *   ldrh  r1, [r5, #0x2]
 *   mov   r1, r1, lsl #0x1f
 *   mov   r1, r1, lsr #0x1f          ; r1 = bit0
 *   bl    func_ov002_02257ab8        ; helper1(self, bit0)
 *   cmp   r0, #0x0
 *   moveq r0, #0x0
 *   ldmeqia sp!, {r3, r4, r5, pc}   ; early-return 0 if helper1 == 0
 *   mov   r0, r5
 *   mov   r1, r4
 *   bl    func_ov002_0228b5f4        ; tail-call helper2(self, arg1)
 *   pop   {r3, r4, r5, pc}
 *
 * The leading `movs r4, r1` (S=1) sets flags so `moveq` after `mov r5, r0`
 * fires on the arg1==0 path. The natural C `if (arg1 == 0) return 0;`
 * leads mwcc to this conditional-pop pattern.
 */

struct F0228b810_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F0228b810_Self {
    unsigned short f0;
    struct F0228b810_F2 f2;
};

extern int func_ov002_02257ab8(struct F0228b810_Self *self, unsigned int bit);
extern int func_ov002_0228b5f4(struct F0228b810_Self *self, int arg1);

int func_ov002_0228b810(struct F0228b810_Self *self, int arg1) {
    if (arg1 == 0) return 0;
    if (func_ov002_02257ab8(self, self->f2.bit0) == 0) return 0;
    return func_ov002_0228b5f4(self, arg1);
}
