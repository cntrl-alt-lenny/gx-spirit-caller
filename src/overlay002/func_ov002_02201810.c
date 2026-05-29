/* func_ov002_02201810: C-39 — 5-arg call. helper(bit0@2, 5, b6_14@4,
 * 0, 0) where the last arg is passed on the stack. Return result != 0.
 *
 *     push  {r3, lr}
 *     mov   r3, #0x0 ; str r3, [sp, #0x0]       ; stack arg = 0
 *     ldrh  r2, [r0, #0x2] ; ldrh r0, [r0, #0x4] ; mov r1, #0x5
 *     lsl   ip, r2, #0x1f ; lsl r2, r0, #0x11
 *     lsr   r0, ip, #0x1f      ; bit0@2
 *     lsr   r2, r2, #0x17      ; bits 6-14 of @4
 *     bl    func_ov002_021ff14c
 *     cmp   r0, #0x0 ; movne r0, #0x1 ; moveq r0, #0x0
 *     pop   {r3, pc}
 */

typedef unsigned short u16;

struct S02201810 {
    u16 _0;
    u16 bit0 : 1;
    u16 f2rest : 15;
    u16 f4lo6 : 6;
    u16 b6_14 : 9;
    u16 f4b15 : 1;
};

extern int func_ov002_021ff14c(int bit0, int k, int bits, int d, int e);

int func_ov002_02201810(struct S02201810 *self) {
    return func_ov002_021ff14c(self->bit0, 5, self->b6_14, 0, 0) != 0;
}
