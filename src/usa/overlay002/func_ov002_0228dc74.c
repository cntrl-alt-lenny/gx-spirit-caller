/* func_ov002_0228dc74: family cc6d27cc — forward func_ov002_021b9dec's
 * result to func_ov002_02253600(self, 0x157a, result).
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     bl    func_ov002_021b9dec
 *     mov   r2, r0
 *     ldr   r1, .L_0228dda4      ; .word 0x157a
 *     mov   r0, r4
 *     bl    func_ov002_02253600  ; (self, 0x157a, func_021b9ecc(self))
 *     pop   {r4, pc}
 */

extern int func_ov002_021b9dec(void *self);
extern void func_ov002_02253600(void *self, int b, int c);

void func_ov002_0228dc74(void *self) {
    func_ov002_02253600(self, 0x157a, func_ov002_021b9dec(self));
}
