/* func_ov002_02223e00: C-39 bit-extract feeding a variable shift.
 * helper(self, 0x1f << ((1 - bit0) << 4)); return 0.
 *
 *     push  {r3, lr}
 *     ldrh  r1, [r0, #0x2]
 *     mov   r2, #0x1f
 *     lsl   r1, r1, #0x1f
 *     lsr   r1, r1, #0x1f        ; bit0
 *     rsb   r1, r1, #0x1         ; 1 - bit0
 *     lsl   r1, r1, #0x4         ; (1 - bit0) << 4
 *     lsl   r1, r2, r1           ; 0x1f << that
 *     bl    func_ov002_021de9c0
 *     mov   r0, #0x0
 *     pop   {r3, pc}
 */

typedef unsigned short u16;

struct S02223e00 {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
};

extern void func_ov002_021de9c0(struct S02223e00 *self, int mask);

int func_ov002_02223e00(struct S02223e00 *self) {
    func_ov002_021de9c0(self, 0x1f << ((1 - self->bit0) << 4));
    return 0;
}
