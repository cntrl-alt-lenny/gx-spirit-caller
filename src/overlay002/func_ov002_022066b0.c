/* func_ov002_022066b0: C-39b cross-call compare with add — return
 * helper(bit0) + helper(1-bit0) > 0.
 *
 * Orig (60 B, 15 ARM insns):
 *   stmdb sp!, {r4, lr}
 *   mov  r4, r0
 *   ldrh r0, [r4, #0x2]
 *   mov  r0, r0, lsl #0x1f
 *   mov  r0, r0, lsr #0x1f             ; r0 = bit0
 *   bl   func_ov002_021c24f8
 *   ldrh r1, [r4, #0x2]
 *   mov  r4, r0                        ; r4 = helper(bit0)
 *   mov  r0, r1, lsl #0x1f
 *   mov  r0, r0, lsr #0x1f
 *   rsb  r0, r0, #0x1                  ; r0 = 1 - bit0
 *   bl   func_ov002_021c24f8
 *   add  r0, r4, r0                    ; sum
 *   cmp  r0, #0x0
 *   movgt r0, #0x1
 *   movle r0, #0x0
 *   pop  {r4, pc}
 */

struct F022066b0_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F022066b0_Self {
    unsigned short f0;
    struct F022066b0_F2 f2;
};

extern int func_ov002_021c24f8(unsigned int v);

int func_ov002_022066b0(struct F022066b0_Self *self) {
    int n = func_ov002_021c24f8(self->f2.bit0);
    return n + func_ov002_021c24f8(1 - self->f2.bit0) > 0;
}
