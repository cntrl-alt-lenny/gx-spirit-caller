/* func_ov002_02235d40: C-39 bit-extract + guard. If helper1(self->bit0)
 * is non-zero return 0; else tail func_022287c4(self, arg).
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0
 *     ldrh  r0, [r5, #0x2]
 *     mov   r4, r1
 *     lsl   r0, r0, #0x1f
 *     lsr   r0, r0, #0x1f        ; bit0
 *     bl    func_ov002_021bcf00
 *     cmp   r0, #0x0
 *     movne r0, #0x0
 *     popne {r3, r4, r5, pc}     ; if (!= 0) return 0
 *     mov   r0, r5
 *     mov   r1, r4
 *     bl    func_ov002_022287c4
 *     pop   {r3, r4, r5, pc}
 */

typedef unsigned short u16;

struct S02235d40 {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
};

extern int func_ov002_021bcf00(int bit);
extern int func_ov002_022287c4(struct S02235d40 *self, int arg);

int func_ov002_02235d40(struct S02235d40 *self, int arg) {
    if (func_ov002_021bcf00(self->bit0) != 0) return 0;
    return func_ov002_022287c4(self, arg);
}
