/* func_ov002_02208470: C-39b tag-check (==3) + sign-check bool tail.
 *
 * Orig (56 B):
 *   stmdb sp!, {r4, lr}
 *   mov   r4, r0
 *   ldrh  r0, [r4, #0x2]
 *   ldrh  r1, [r4, #0x0]              ; r1 = self->f0
 *   mov   r0, r0, lsl #0x1f
 *   mov   r0, r0, lsr #0x1f            ; r0 = bit0
 *   bl    func_ov002_021bb82c          ; helper1(bit0, f0)
 *   cmp   r0, #0x3
 *   movne r0, #0x0
 *   ldmneia sp!, {r4, pc}              ; early-return 0 if != 3
 *   mov   r0, r4
 *   bl    func_ov002_022576f4          ; helper2(self)
 *   cmp   r0, #0x2
 *   movge r0, #0x1
 *   movlt r0, #0x0
 *   pop   {r4, pc}
 */

struct F02208560_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02208560_Self {
    unsigned short f0;
    struct F02208560_F2 f2;
};

extern int func_ov002_021bb82c(unsigned int bit, unsigned short f0);
extern int func_ov002_022576f4(struct F02208560_Self *self);

int func_ov002_02208470(struct F02208560_Self *self) {
    if (func_ov002_021bb82c(self->f2.bit0, self->f0) != 3) return 0;
    return func_ov002_022576f4(self) >= 2;
}
