/* func_ov002_021f4f68: C-39 bit-extract under a sign-check (gotcha 5 —
 * if-then, not early-return). Run pre(); if its result is negative,
 * call the bit-extract helper; return the pre() result.
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0
 *     bl    func_ov002_021f4994
 *     movs  r4, r0
 *     bpl   .L                   ; if (r >= 0) skip
 *     ldrh  r0, [r5, #0x2]
 *     ldrh  r1, [r5, #0x0]
 *     mov   r2, #0x1
 *     lsl   r0, r0, #0x1f
 *     lsr   r0, r0, #0x1f        ; bit0
 *     mov   r3, #0x0
 *     bl    func_ov002_021e267c
 *  .L:
 *     mov   r0, r4
 *     pop   {r3, r4, r5, pc}
 */

typedef unsigned short u16;

struct S021f5058 {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
};

extern int func_ov002_021f4994(struct S021f5058 *self);
extern void func_ov002_021e267c(int a0, u16 a1, int a2, int a3);

int func_ov002_021f4f68(struct S021f5058 *self) {
    int r = func_ov002_021f4994(self);
    if (r < 0) {
        func_ov002_021e267c(self->bit0, self->f0, 1, 0);
    }
    return r;
}
