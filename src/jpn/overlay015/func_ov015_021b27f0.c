/* func_ov015_021b27f0: family 02ccf8d8 sibling of ov010_021b28f0 (same
 * address, overlapping overlay). Identical shape.
 *
 *     push  {r3, r4, r5, r6, r7, lr}
 *     mov   r7, r0
 *     mov   r6, r1
 *     mov   r5, r2
 *     mov   r4, #0x0
 *  .L:
 *     ldrh  r1, [r5], #0x2
 *     mov   r0, r6
 *     bl    func_0207e550
 *     str   r0, [r7, r4, lsl #0x2]
 *     add   r4, r4, #0x1
 *     cmp   r4, #0x2
 *     blt   .L
 *     pop   {r3, r4, r5, r6, r7, pc}
 */

extern int func_0207e550(int ctx, unsigned short v);

void func_ov015_021b27f0(int *dst, int ctx, unsigned short *src) {
    int i;
    for (i = 0; i < 2; i++) {
        dst[i] = func_0207e550(ctx, *src++);
    }
}
