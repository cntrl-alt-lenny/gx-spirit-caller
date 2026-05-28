/* func_ov015_021b3240: family 575ddc6a sibling of ov010_021b3734
 * (identical body). Same clamp-and-store shape, same cross-overlay
 * helper func_020b3870.
 *
 *     push  {r4, r5, r6, lr}
 *     mov   r6, r0
 *     mov   r4, r2
 *     movs  r5, r1
 *     ldrsh r2, [r6, #0x5a]
 *     ldrsh r0, [r6, #0x56]
 *     ldrsh r1, [r6, #0x6c]
 *     movmi r5, #0x0
 *     sub   r0, r2, r0
 *     bl    func_020b3870
 *     sub   r0, r0, #0x1
 *     cmp   r4, r0
 *     movgt r4, r0
 *     str   r5, [r6, #0x60]
 *     str   r4, [r6, #0x64]
 *     pop   {r4, r5, r6, pc}
 */

struct S575 {
    char _pad[0x56];
    short f56;
    short _58;
    short f5a;
    char _g5c[4];
    int f60;
    int f64;
    char _g68[4];
    short f6c;
};

extern int func_020b3870(int a, int b, int c);

void func_ov015_021b3240(struct S575 *self, int a1, int a2) {
    int r;
    if (a1 < 0) a1 = 0;
    r = func_020b3870(self->f5a - self->f56, self->f6c, self->f5a) - 1;
    if (a2 > r) a2 = r;
    self->f60 = a1;
    self->f64 = a2;
}
