/* func_ov015_021b225c: family f83d4ff8 sibling of ov010_021b235c (same
 * address, overlapping overlay). Identical shape, same cross-overlay
 * global + helper.
 *
 *     push  {r4, lr}
 *     ldr   r1, .L_021b2388      ; .word data_ov015_021b5c2c
 *     mov   r4, r0
 *     mov   r0, #0x0
 *     mov   r2, #0xa4
 *     bl    Fill32               ; Fill32(0, data_ov015_021b5c2c, 0xa4)
 *     mov   r0, r4
 *     bl    func_ov005_021aa3d0
 *     mov   r0, #0x0
 *     str   r0, [r4, #0x0]
 *     pop   {r4, pc}
 */

extern char data_ov015_021b5c2c[];
extern void Fill32(int value, void *dst, int len);
extern void func_ov005_021aa3d0(void *self);

void func_ov015_021b225c(int *self) {
    Fill32(0, data_ov015_021b5c2c, 0xa4);
    func_ov005_021aa3d0(self);
    *self = 0;
}
