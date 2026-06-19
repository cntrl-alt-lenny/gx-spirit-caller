/* func_ov002_0228dd24: family cc6d27cc sibling of 0228dd84 — same
 * shape, literal 0x198e.
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     bl    func_ov002_021b9dec
 *     mov   r2, r0
 *     ldr   r1, .L_0228de54      ; .word 0x198e
 *     mov   r0, r4
 *     bl    func_ov002_02253600  ; (self, 0x198e, func_021b9ecc(self))
 *     pop   {r4, pc}
 */

extern int func_ov002_021b9dec(void *self);
extern void func_ov002_02253600(void *self, int b, int c);

void func_ov002_0228dd24(void *self) {
    func_ov002_02253600(self, 0x198e, func_ov002_021b9dec(self));
}
