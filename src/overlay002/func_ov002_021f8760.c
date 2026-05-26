/* func_ov002_021f8760: C-39b helper-reuse + conditional 2nd helper.
 *
 * Orig (60 B, 15 ARM insns):
 *   stmdb sp!, {r3, r4, r5, lr}
 *   mov   r5, r0
 *   bl    func_ov002_021f4a84
 *   mov   r4, r0                     ; r4 = helper1(self)
 *   cmp   r4, #0x1
 *   bne   .L_021f87a0
 *   mov   r0, #0x0                   ; mwcc dead-store (overridden by ldrh)
 *   ldrh  r0, [r5, #0x2]
 *   ldr   r2, .L_021f87a8            ; 0x16cb
 *   mov   r3, #0x2
 *   mov   ip, r0, lsl #0x1f
 *   mov   r1, r0, lsl #0x1a
 *   mov   r0, ip, lsr #0x1f          ; r0 = bit0 (via ip-temp)
 *   mov   r1, r1, lsr #0x1b          ; r1 = bits 26..30 (5-bit f2 field at offset 26)
 *   bl    func_ov002_021d59cc        ; helper2(bit0, multibit, 0x16cb, 2)
 *  .L_021f87a0:
 *   mov   r0, r4                     ; return helper1 ret
 *   pop   {r3, r4, r5, pc}
 *
 * Brief 226 C-39b shape: `int r = helper1(self); if (r == 1) helper2(...); return r;`.
 * The `mov #0; ldrh r0, ...` dead-store is mwcc's argument-load shuffle for the
 * `0` literal that the bitfield extract clobbers — eager move from constant
 * pool with the immediate value the bitfield-load eclipses.
 */

struct F021f8760_F2 {
    unsigned short bit0  : 1;
    unsigned short multi : 5;        /* bits 1..5 of halfword */
    unsigned short rest  : 10;
};
struct F021f8760_Self {
    unsigned short f0;
    struct F021f8760_F2 f2;
};

extern int func_ov002_021f4a84(struct F021f8760_Self *self);
extern int func_ov002_021d59cc(unsigned int bit, unsigned int multi, int tag, int mode, int extra);

int func_ov002_021f8760(struct F021f8760_Self *self) {
    int r = func_ov002_021f4a84(self);
    if (r == 1) {
        func_ov002_021d59cc(self->f2.bit0, self->f2.multi, 0x16cb, 2, 0);
    }
    return r;
}
