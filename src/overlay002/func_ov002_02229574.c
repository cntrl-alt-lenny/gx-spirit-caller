/* func_ov002_02229574: C-39 bit-extract, 4-arg multi-field call.
 * helper(1 - bit0@2, f0@0, 1, fc@0xc); return 0.
 *
 *     push  {r3, lr}
 *     ldrh  r2, [r0, #0x2]
 *     ldrh  r1, [r0, #0x0]
 *     ldrh  r3, [r0, #0xc]
 *     lsl   r0, r2, #0x1f
 *     lsr   r0, r0, #0x1f        ; bit0@2
 *     rsb   r0, r0, #0x1         ; 1 - bit0
 *     mov   r2, #0x1
 *     bl    func_ov002_021e276c
 *     mov   r0, #0x0
 *     pop   {r3, pc}
 */

typedef unsigned short u16;

struct S02229574 {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
    u16 _4;
    u16 _6;
    u16 _8;
    u16 _a;
    u16 fc;
};

extern void func_ov002_021e276c(int a0, u16 a1, int a2, u16 a3);

int func_ov002_02229574(struct S02229574 *self) {
    func_ov002_021e276c(1 - self->bit0, self->f0, 1, self->fc);
    return 0;
}
