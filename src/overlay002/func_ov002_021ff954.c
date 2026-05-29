/* func_ov002_021ff954: C-39 — early-return 1 if the 6-bit field at
 * bits 6-11 equals 2; else return helper(self, 1 - bit0) != 0.
 *
 *     push  {r3, lr}
 *     ldrh  r1, [r0, #0x2]
 *     lsl   r2, r1, #0x14 ; lsr r2, r2, #0x1a    ; bits 6-11
 *     cmp   r2, #0x2 ; moveq r0, #0x1 ; popeq {r3, pc}
 *     lsl   r1, r1, #0x1f ; lsr r1, r1, #0x1f ; rsb r1, r1, #0x1   ; 1 - bit0
 *     bl    func_ov002_021ff2b8
 *     cmp   r0, #0x0 ; movne r0, #0x1 ; moveq r0, #0x0
 *     pop   {r3, pc}
 */

typedef unsigned short u16;

struct S021ff954 {
    u16 f0;
    u16 bit0 : 1;
    u16 b1_5 : 5;
    u16 b6_11 : 6;
    u16 b12_15 : 4;
};

extern int func_ov002_021ff2b8(struct S021ff954 *self, int arg);

int func_ov002_021ff954(struct S021ff954 *self) {
    if (self->b6_11 == 2) return 1;
    return func_ov002_021ff2b8(self, 1 - self->bit0) != 0;
}
