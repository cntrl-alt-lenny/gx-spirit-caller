/* func_ov015_021b24f8: family d8f09697 sibling of ov010_021b25f8 (same
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
 *     add   r1, r7, r4, lsl #0x2
 *     add   r4, r4, #0x1
 *     str   r0, [r1, #0x74]
 *     cmp   r4, #0x6
 *     blt   .L
 *     pop   {r3, r4, r5, r6, r7, pc}
 */

extern int func_0207e550(int ctx, unsigned short v);

struct D021b25f8 {
    char pad[0x74];
    int arr[6];
};

void func_ov015_021b24f8(struct D021b25f8 *dst, int ctx, unsigned short *src) {
    int i;
    for (i = 0; i < 6; i++) {
        dst->arr[i] = func_0207e550(ctx, *src++);
    }
}
