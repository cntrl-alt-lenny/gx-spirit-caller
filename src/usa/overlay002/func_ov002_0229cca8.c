/* func_ov002_0229cca8: family be365725 sibling of 0229cd88 — same
 * shape, second helper func_020aae1c.
 *
 *     push  {r4, lr}
 *     mov   r2, #0x20000
 *     rsb   r2, r2, #0x0
 *     mov   r4, r0
 *     tst   r1, r2
 *     bne   .L
 *     mov   r0, r1
 *     bl    func_0202b778
 *     mov   r1, r0
 *  .L:
 *     mov   r0, r4
 *     bl    func_020aae1c
 *     pop   {r4, pc}
 */

extern int func_0202b778(unsigned int v);
extern void func_020aae1c(void *self, int x);

void func_ov002_0229cca8(void *self, unsigned int arg1) {
    int x = arg1;
    if (!(arg1 & 0xfffe0000)) x = func_0202b778(arg1);
    func_020aae1c(self, x);
}
