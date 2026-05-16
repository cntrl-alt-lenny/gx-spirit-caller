/* func_0206f054: P-9 early-return — zero-check, then sequenced helpers (sp2p3).
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
 *     bl    func_02070f44
 *     bl    func_02070fe8
 *     mov   r2, r5
 *     mov   r0, #0x0
 *     mov   r1, #0x35
 *     bl    func_02070f78
 *     mov   r0, r6
 *     mov   r2, r4
 *     mov   r3, #0x0
 *     str   r3, [sp, #0x0]
 *     mov   r1, #0x1
 *     bl    func_0206f1a4
 *     mov   r4, r0
 *     bl    func_02070f24
 *     mov   r0, r4
 *     add   sp, sp, #0x8
 *     pop   {r4, r5, r6, lr}
 *     bx    lr
 */

extern void func_02070f44(void);
extern void func_02070fe8(void);
extern void func_02070f78(int a, int b, int c);
extern int  func_0206f1a4(int a, int b, int c, int d, int e);
extern void func_02070f24(void);

int func_0206f054(int arg0, int arg1, int arg2) {
    int r;
    if (arg1 == 0) return -1;
    func_02070f44();
    func_02070fe8();
    func_02070f78(0, 0x35, arg1);
    r = func_0206f1a4(arg0, 1, arg2, 0, 0);
    func_02070f24();
    return r;
}
