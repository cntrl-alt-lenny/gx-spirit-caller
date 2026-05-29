/* func_ov002_0223fd2c: C-39 bit-extract base recipe (brief 252 pilot).
 * Read bit 0 of the u16 bitfield at +2, pass 1 - bit0 (u16) to the
 * helper, return 1. The bitfield (not `& 1`) keeps the lsl/lsr extract;
 * the `1 - x` form (not `== 0`) avoids predication.
 *
 *     push  {r3, lr}
 *     ldrh  r1, [r0, #0x2]
 *     lsl   r1, r1, #0x1f       ; \ extract bit 0
 *     lsr   r1, r1, #0x1f       ; /
 *     rsb   r1, r1, #0x1        ; 1 - bit0
 *     lsl   r1, r1, #0x10       ; \ u16 zero-extend
 *     lsr   r1, r1, #0x10       ; /
 *     bl    func_ov002_0223dad0
 *     mov   r0, #0x1
 *     pop   {r3, pc}
 */

typedef unsigned short u16;

struct S0223fd2c {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
};

extern void func_ov002_0223dad0(struct S0223fd2c *self, u16 arg);

int func_ov002_0223fd2c(struct S0223fd2c *self) {
    func_ov002_0223dad0(self, 1 - self->bit0);
    return 1;
}
