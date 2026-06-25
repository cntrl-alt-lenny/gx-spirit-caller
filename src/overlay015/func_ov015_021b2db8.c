/* func_ov015_021b2db8: family 46f91df6 sibling of ov010_021b2db8
 * (same address, overlapping overlay). Identical shape; base helper is
 * Ov015_SelectVramBank.
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r1
 *     mov   r4, r2
 *     bl    Ov015_SelectVramBank
 *     add   r1, r0, r5, lsl #0x5  ; base + (a1 << 5)
 *     lsl   r2, r4, #0x5          ; a2 << 5
 *     mov   r0, #0x0
 *     bl    Fill32                ; Fill32(0, base + a1*32, a2*32)
 *     pop   {r3, r4, r5, pc}
 */

extern int Ov015_SelectVramBank(void *self);
extern void Fill32(int value, int dst, int len);

void func_ov015_021b2db8(void *self, int a1, int a2) {
    Fill32(0, Ov015_SelectVramBank(self) + (a1 << 5), a2 << 5);
}
