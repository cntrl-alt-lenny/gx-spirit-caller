/* func_ov002_0220dbac: C-39b helper-check + tail-call.
 *
 * Orig (56 B):
 *   stmdb sp!, {r3, r4, r5, lr}
 *   mov   r5, r0
 *   ldrh  r0, [r5, #0x2]
 *   mov   r4, r1                   ; r4 = arg1
 *   ldrh  r2, [r5, #0x0]
 *   mov   r0, r0, lsl #0x1f
 *   mov   r0, r0, lsr #0x1f         ; r0 = bit0
 *   mov   r1, #0xb                  ; r1 = 11
 *   bl    func_ov002_021b3dec       ; helper1(bit0, 11, f0)
 *   cmp   r0, #0x0
 *   movne r0, #0x0
 *   ldmneia sp!, {r3, r4, r5, pc}   ; early-return 0 if != 0
 *   mov   r0, r5
 *   mov   r1, r4
 *   bl    func_ov002_021ff310       ; tail-call helper2(self, arg1)
 *   pop   {r3, r4, r5, pc}
 */

struct F0220dc9c_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F0220dc9c_Self {
    unsigned short f0;
    struct F0220dc9c_F2 f2;
};

extern int func_ov002_021b3dec(unsigned int bit, int eleven, unsigned short f0);
extern int func_ov002_021ff310(struct F0220dc9c_Self *self, int arg1);

int func_ov002_0220dbac(struct F0220dc9c_Self *self, int arg1) {
    if (func_ov002_021b3dec(self->f2.bit0, 0xb, self->f0) != 0) return 0;
    return func_ov002_021ff310(self, arg1);
}
