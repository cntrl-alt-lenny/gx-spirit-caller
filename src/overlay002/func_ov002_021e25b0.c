/* func_ov002_021e25b0: family 3e76dd44 sibling of 021e2570 — same
 * shape, constant 0xc.
 *
 *     push  {r3, r4, r5, r6, lr}
 *     sub   sp, sp, #0x4
 *     mov   r5, r1               ; b
 *     mov   r4, r2               ; c
 *     mov   r6, r0               ; a
 *     mov   r2, r5
 *     mov   r1, #0xc
 *     bl    func_ov002_021c93f0  ; (a, 0xc, b)
 *     mov   r3, r0
 *     mov   r0, r6
 *     mov   r2, r5
 *     mov   r1, #0xc
 *     str   r4, [sp, #0x0]       ; stack arg c
 *     bl    func_ov002_021e1c8c  ; (a, 0xc, b, prev, c)
 *     add   sp, sp, #0x4
 *     pop   {r3, r4, r5, r6, pc}
 */

extern int func_ov002_021c93f0(int a, int k, int b);
extern void func_ov002_021e1c8c(int a, int k, int b, int r, int c);

void func_ov002_021e25b0(int a, int b, int c) {
    func_ov002_021e1c8c(a, 0xc, b, func_ov002_021c93f0(a, 0xc, b), c);
}
