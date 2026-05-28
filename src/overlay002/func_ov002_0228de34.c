/* func_ov002_0228de34: family cc6d27cc sibling of 0228dd84 — same
 * shape, literal 0x198e.
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     bl    func_ov002_021b9ecc
 *     mov   r2, r0
 *     ldr   r1, .L_0228de54      ; .word 0x198e
 *     mov   r0, r4
 *     bl    func_ov002_022536e8  ; (self, 0x198e, func_021b9ecc(self))
 *     pop   {r4, pc}
 */

extern int func_ov002_021b9ecc(void *self);
extern void func_ov002_022536e8(void *self, int b, int c);

void func_ov002_0228de34(void *self) {
    func_ov002_022536e8(self, 0x198e, func_ov002_021b9ecc(self));
}
