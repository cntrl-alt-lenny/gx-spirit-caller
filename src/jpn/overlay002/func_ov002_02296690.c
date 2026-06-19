/* func_ov002_02296690: C-39b 3-helper chain (helper-reuse + sign-check
 * tail-call).
 *
 * Orig (68 B, 17 ARM insns):
 *   stmdb sp!, {r3, r4, r5, lr}
 *   mov   r5, r0                     ; save self
 *   mov   r4, r1                     ; save arg1
 *   bl    func_ov002_022575f0        ; helper1(self) [r0=self via passthrough]
 *   ldrh  r3, [r5, #0x2]
 *   mov   r1, r0                     ; r1 = helper1 ret
 *   mov   r2, #0x1
 *   mov   r0, r3, lsl #0x1f
 *   mov   r0, r0, lsr #0x1f          ; r0 = bit0
 *   bl    func_ov002_0228cf9c        ; helper2(bit0, helper1_ret, 1)
 *   cmp   r0, #0x0
 *   movlt r0, #0x0                   ; dead (overridden next)
 *   mov   r0, r5
 *   mov   r1, r4
 *   bl    func_ov002_02291104        ; tail-call helper3(self, arg1)
 *   pop   {r3, r4, r5, pc}
 *
 * Brief 226 Idiom 3 variant — helper-return used as helper2's middle arg.
 * Tail call to helper3 returns its value. The `movlt r0, #0` is a mwcc
 * dead-store artifact (overridden by `mov r0, r5`).
 */

struct F022967a0_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F022967a0_Self {
    unsigned short f0;
    struct F022967a0_F2 f2;
};

extern int func_ov002_022575f0(struct F022967a0_Self *self);
extern int func_ov002_0228cf9c(unsigned int bit, int n, int flag);
extern int func_ov002_02291104(struct F022967a0_Self *self, int arg1);

int func_ov002_02296690(struct F022967a0_Self *self, int arg1) {
    int n = func_ov002_022575f0(self);
    if (func_ov002_0228cf9c(self->f2.bit0, n, 1) < 0) return 0;
    return func_ov002_02291104(self, arg1);
}
