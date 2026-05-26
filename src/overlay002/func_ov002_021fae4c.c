/* func_ov002_021fae4c: C-39b 2-helper sequence (no compare).
 *
 * Orig (48 B, 12 ARM insns):
 *   stmdb sp!, {r4, lr}
 *   mov   r4, r0
 *   bl    func_ov002_021f4a4c       ; helper1(self)
 *   ldrh  r0, [r4, #0x2]
 *   mov   r3, r0, lsl #0x1f         ; preserve halfword in r0 for 2nd extract
 *   mov   r1, r0, lsl #0x1a         ; second bitfield extract from halfword
 *   mov   r0, r3, lsr #0x1f         ; r0 = bit0
 *   mov   r1, r1, lsr #0x1b         ; r1 = 5-bit field at bit position 1
 *   bl    func_ov002_021d93e0       ; helper2(bit0, multi5)
 *   mov   r0, #0x1
 *   pop   {r4, pc}
 *
 * Brief 228 Shape α-like (2-helper sequence) but no helper-return reuse —
 * helper1's return is discarded; helper2 gets (bit0, multi5) extracted
 * from self->f2.
 */

struct F021fae4c_F2 {
    unsigned short bit0   : 1;
    unsigned short multi5 : 5;        /* bits 1..5 */
    unsigned short rest   : 10;
};
struct F021fae4c_Self {
    unsigned short f0;
    struct F021fae4c_F2 f2;
};

extern int func_ov002_021f4a4c(struct F021fae4c_Self *self);
extern int func_ov002_021d93e0(unsigned int bit, unsigned int multi, int sentinel);

int func_ov002_021fae4c(struct F021fae4c_Self *self) {
    func_ov002_021f4a4c(self);
    func_ov002_021d93e0(self->f2.bit0, self->f2.multi5, ~0);
    return 1;
}
