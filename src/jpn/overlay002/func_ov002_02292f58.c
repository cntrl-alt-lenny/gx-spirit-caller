/* func_ov002_02292f58: C-39b cross-call compare — same helper, both
 * polarities of self->f2.bit0, return (helper(1-bit0) < helper(bit0)).
 *
 * Orig (56 B, 14 ARM insns):
 *   stmdb sp!, {r4, lr}
 *   mov  r4, r0
 *   ldrh r0, [r4, #0x2]
 *   mov  r0, r0, lsl #0x1f
 *   mov  r0, r0, lsr #0x1f
 *   rsb  r0, r0, #0x1                  ; r0 = 1 - bit0
 *   bl   func_ov002_021bbe70
 *   ldrh r1, [r4, #0x2]                ; re-read; no CSE across bl
 *   mov  r4, r0                        ; r4 = helper(1-bit0)
 *   mov  r0, r1, lsl #0x1f
 *   mov  r0, r0, lsr #0x1f             ; r0 = bit0
 *   bl   func_ov002_021bbe70
 *   cmp  r4, r0
 *   movlt r0, #0x1                     ; lt → 1
 *   movge r0, #0x0
 *   pop  {r4, pc}
 *
 * Brief 226 Idiom 2 (cross-call compare). n stays in r4 across helper2
 * because helper2 clobbers r0-r3.
 */

struct F02293068_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02293068_Self {
    unsigned short f0;
    struct F02293068_F2 f2;
};

extern int func_ov002_021bbe70(unsigned int v);

int func_ov002_02292f58(struct F02293068_Self *self) {
    int n = func_ov002_021bbe70(1 - self->f2.bit0);
    return n < func_ov002_021bbe70(self->f2.bit0);
}
