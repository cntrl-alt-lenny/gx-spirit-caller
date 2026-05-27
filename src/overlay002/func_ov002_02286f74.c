/* func_ov002_02286f74: C-39b early-return-on-neg + bool tail.
 *
 * Orig (56 B):
 *   stmdb sp!, {r4, lr}
 *   mov   r4, r0
 *   ldrh  r0, [r4, #0x2]
 *   mov   r0, r0, lsl #0x1f
 *   mov   r0, r0, lsr #0x1f
 *   bl    func_ov002_02280980        ; helper1(bit0)
 *   cmp   r0, #0x0
 *   movlt r0, #0x0
 *   ldmltia sp!, {r4, pc}            ; early-return 0 if < 0
 *   ldr   r1, .L_02286fb4             ; func_ov002_021f162c pool word
 *   mov   r0, r4
 *   bl    func_ov002_02257878        ; helper2(self, &helper_ref)
 *   cmp   r0, #0x2
 *   movge r0, #0x1
 *   movlt r0, #0x0
 *   pop   {r4, pc}
 *
 * Brief 230 early-return form (mwcc emits ldmltia for `if (x < 0) return 0;`).
 */

struct F02286f74_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02286f74_Self {
    unsigned short f0;
    struct F02286f74_F2 f2;
};

extern int func_ov002_02280980(unsigned int bit);
extern int func_ov002_021f162c(unsigned int bit);  /* helper2 takes this fn-ptr */
extern int func_ov002_02257878(struct F02286f74_Self *self, int (*fnref)(unsigned int));

int func_ov002_02286f74(struct F02286f74_Self *self) {
    if (func_ov002_02280980(self->f2.bit0) < 0) return 0;
    return func_ov002_02257878(self, func_ov002_021f162c) >= 2;
}
