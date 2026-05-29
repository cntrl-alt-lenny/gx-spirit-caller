/* func_ov002_02295ec4: C-39 — store helper1(bit0, b1_5) into self->fc,
 * then tail helper2(self, arg).
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0 ; ldrh r0, [r5, #0x2] ; mov r4, r1
 *     lsl   r2, r0, #0x1f ; lsl r1, r0, #0x1a ; lsr r0, r2, #0x1f ; lsr r1, r1, #0x1b
 *     bl    func_ov002_021b9e00    ; (bit0, b1_5)
 *     strh  r0, [r5, #0xc]
 *     mov   r0, r5 ; mov r1, r4 ; bl func_ov002_02291114
 *     pop   {r3, r4, r5, pc}
 */

typedef unsigned short u16;

struct S02295ec4 {
    u16 f0;
    u16 bit0 : 1;
    u16 b1_5 : 5;
    u16 rest : 10;
    u16 _4;
    u16 _6;
    u16 _8;
    u16 _a;
    u16 fc;
};

extern int func_ov002_021b9e00(int bit0, int b1_5);
extern int func_ov002_02291114(struct S02295ec4 *self, int arg);

int func_ov002_02295ec4(struct S02295ec4 *self, int arg) {
    self->fc = func_ov002_021b9e00(self->bit0, self->b1_5);
    return func_ov002_02291114(self, arg);
}
