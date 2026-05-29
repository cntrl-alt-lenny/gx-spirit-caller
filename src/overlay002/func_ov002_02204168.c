/* func_ov002_02204168: C-39 + XOR of two bitfields (gotcha 4 — bit0
 * extracted first, so it is the LEFT operand). Return
 * helper(bit0 ^ bit14, bit0, b1_5) != 0.
 *
 *     push  {r3, lr}
 *     ldrh  r0, [r0, #0x2]
 *     lsl   r1, r0, #0x1f       ; \ bit0 -> r1
 *     lsl   r2, r0, #0x1a       ;   (b1_5 setup)
 *     lsr   r1, r1, #0x1f       ; /
 *     lsl   r0, r0, #0x11       ; \ bit0 ^ bit14
 *     eor   r0, r1, r0, lsr #0x1f
 *     lsr   r2, r2, #0x1b       ; b1_5
 *     bl    func_ov002_021bc8c8
 *     cmp   r0, #0x0 ; movne r0, #0x1 ; moveq r0, #0x0
 *     pop   {r3, pc}
 */

typedef unsigned short u16;

struct S02204168 {
    u16 f0;
    u16 bit0 : 1;
    u16 b1_5 : 5;
    u16 b6_13 : 8;
    u16 bit14 : 1;
    u16 b15 : 1;
};

extern int func_ov002_021bc8c8(int x, int bit0, int b1_5);

int func_ov002_02204168(struct S02204168 *self) {
    return func_ov002_021bc8c8(self->bit0 ^ self->bit14, self->bit0,
                               self->b1_5) != 0;
}
