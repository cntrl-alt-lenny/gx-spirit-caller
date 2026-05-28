/* func_ov002_0229cd88: family be365725 — if no high bits set in arg1,
 * remap it through func_0202b7cc; then func_020aadf8(self, value).
 *
 *     push  {r4, lr}
 *     mov   r2, #0x20000
 *     rsb   r2, r2, #0x0         ; r2 = 0xfffe0000
 *     mov   r4, r0
 *     tst   r1, r2
 *     bne   .L
 *     mov   r0, r1
 *     bl    func_0202b7cc
 *     mov   r1, r0
 *  .L:
 *     mov   r0, r4
 *     bl    func_020aadf8
 *     pop   {r4, pc}
 */

extern int func_0202b7cc(unsigned int v);
extern void func_020aadf8(void *self, int x);

void func_ov002_0229cd88(void *self, unsigned int arg1) {
    int x = arg1;
    if (!(arg1 & 0xfffe0000)) x = func_0202b7cc(arg1);
    func_020aadf8(self, x);
}
