/* func_ov002_0229cc78: family be365725 — if no high bits set in arg1,
 * remap it through func_0202b778; then func_020aad04(self, value).
 *
 *     push  {r4, lr}
 *     mov   r2, #0x20000
 *     rsb   r2, r2, #0x0         ; r2 = 0xfffe0000
 *     mov   r4, r0
 *     tst   r1, r2
 *     bne   .L
 *     mov   r0, r1
 *     bl    func_0202b778
 *     mov   r1, r0
 *  .L:
 *     mov   r0, r4
 *     bl    func_020aad04
 *     pop   {r4, pc}
 */

extern int func_0202b778(unsigned int v);
extern void func_020aad04(void *self, int x);

void func_ov002_0229cc78(void *self, unsigned int arg1) {
    int x = arg1;
    if (!(arg1 & 0xfffe0000)) x = func_0202b778(arg1);
    func_020aad04(self, x);
}
