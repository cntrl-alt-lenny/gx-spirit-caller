/* func_ov002_021e2480: family 3e76dd44 — call func_ov002_021c9310(a,
 * 0xd, b), then func_ov002_021e1b9c(a, 0xd, b, that_result, c) with c
 * passed on the stack (5th arg).
 *
 *     push  {r3, r4, r5, r6, lr}
 *     sub   sp, sp, #0x4
 *     mov   r5, r1               ; b
 *     mov   r4, r2               ; c
 *     mov   r6, r0               ; a
 *     mov   r2, r5
 *     mov   r1, #0xd
 *     bl    func_ov002_021c9310  ; (a, 0xd, b)
 *     mov   r3, r0
 *     mov   r0, r6
 *     mov   r2, r5
 *     mov   r1, #0xd
 *     str   r4, [sp, #0x0]       ; stack arg c
 *     bl    func_ov002_021e1b9c  ; (a, 0xd, b, prev, c)
 *     add   sp, sp, #0x4
 *     pop   {r3, r4, r5, r6, pc}
 */

extern int func_ov002_021c9310(int a, int k, int b);
extern void func_ov002_021e1b9c(int a, int k, int b, int r, int c);

void func_ov002_021e2480(int a, int b, int c) {
    func_ov002_021e1b9c(a, 0xd, b, func_ov002_021c9310(a, 0xd, b), c);
}
