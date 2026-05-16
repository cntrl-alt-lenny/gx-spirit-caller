/* func_0206efe0: P-9 early-return — zero-check, then sequenced helpers (sp2p3).
 *
 *     push  {r4, r5, r6, lr}
 *     sub   sp, sp, #0x8
 *     movs  r5, r1
 *     mov   r6, r0
 *     mov   r4, r2
 *     addeq sp, sp, #0x8
 *     mvneq r0, #0x0
 *     popeq {r4, r5, r6, lr}
 *     bxeq  lr
 *     bl    func_02070e5c
 *     bl    func_02070f00
 *     mov   r2, r5
 *     mov   r0, #0x0
 *     mov   r1, #0x35
 *     bl    func_02070e90
 *     mov   r0, r6
 *     mov   r2, r4
 *     mov   r3, #0x0
 *     str   r3, [sp, #0x0]
 *     mov   r1, #0x1
 *     bl    func_0206f130
 *     mov   r4, r0
 *     bl    func_02070e3c
 *     mov   r0, r4
 *     add   sp, sp, #0x8
 *     pop   {r4, r5, r6, lr}
 *     bx    lr
 */

extern void func_02070e5c(void);
extern void func_02070f00(void);
extern void func_02070e90(int a, int b, int c);
extern int  func_0206f130(int a, int b, int c, int d, int e);
extern void func_02070e3c(void);

int func_0206efe0(int arg0, int arg1, int arg2) {
    int r;
    if (arg1 == 0) return -1;
    func_02070e5c();
    func_02070f00();
    func_02070e90(0, 0x35, arg1);
    r = func_0206f130(arg0, 1, arg2, 0, 0);
    func_02070e3c();
    return r;
}
