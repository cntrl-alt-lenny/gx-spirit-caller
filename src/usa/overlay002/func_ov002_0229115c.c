/* func_ov002_0229115c: C-39 bit-extract + guard (== 0 polarity). If
 * helper1(self->bit0) is zero return 0; else tail func_02291114.
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0
 *     ldrh  r0, [r5, #0x2]
 *     mov   r4, r1
 *     lsl   r0, r0, #0x1f
 *     lsr   r0, r0, #0x1f        ; bit0
 *     bl    func_ov002_02281964
 *     cmp   r0, #0x0
 *     moveq r0, #0x0
 *     popeq {r3, r4, r5, pc}     ; if (== 0) return 0
 *     mov   r0, r5
 *     mov   r1, r4
 *     bl    func_ov002_02291004
 *     pop   {r3, r4, r5, pc}
 */

typedef unsigned short u16;

struct S0229126c {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
};

extern int func_ov002_02281964(int bit);
extern int func_ov002_02291004(struct S0229126c *self, int arg);

int func_ov002_0229115c(struct S0229126c *self, int arg) {
    if (func_ov002_02281964(self->bit0) == 0) return 0;
    return func_ov002_02291004(self, arg);
}
