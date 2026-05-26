/* func_ov002_02296a38: C-39b sign-check + tail-call (early-return on small).
 *
 * Orig (56 B):
 *   stmdb sp!, {r3, r4, r5, lr}
 *   mov   r5, r0
 *   ldrh  r0, [r5, #0x2]
 *   mov   r4, r1                   ; r4 = arg1
 *   mvn   r1, #0x0                  ; r1 = ~0 = -1
 *   mov   r0, r0, lsl #0x1f
 *   mov   r0, r0, lsr #0x1f          ; r0 = bit0
 *   mov   r2, #0x0
 *   bl    func_ov002_0227b0b8        ; helper1(bit0, -1, 0)
 *   cmp   r0, #0x7d0
 *   movlt r0, #0x0
 *   ldmltia sp!, {r3, r4, r5, pc}   ; early-return 0 if < 0x7d0
 *   mov   r0, r5
 *   mov   r1, r4
 *   bl    func_ov002_02291248        ; tail-call helper2(self, arg1)
 *   pop   {r3, r4, r5, pc}
 */

struct F02296a38_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02296a38_Self {
    unsigned short f0;
    struct F02296a38_F2 f2;
};

extern int func_ov002_0227b0b8(unsigned int bit, int neg1, int zero);
extern int func_ov002_02291248(struct F02296a38_Self *self, int arg1);

int func_ov002_02296a38(struct F02296a38_Self *self, int arg1) {
    if (func_ov002_0227b0b8(self->f2.bit0, ~0, 0) < 0x7d0) return 0;
    return func_ov002_02291248(self, arg1);
}
