/* func_02009230: 2-call helper preserving arg.
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r1, #0x0
 *     mov   r5, r0
 *     bl    func_02008f9c
 *     mov   r4, r0
 *     mov   r0, #0x0
 *     mov   r1, r5
 *     mov   r2, r0
 *     bl    func_02008c68
 *     mov   r0, r4
 *     pop   {r3, r4, r5, pc}
 */

extern int func_02008f9c(int a, int b);
extern int func_02008c68(int a, int b, int c);

int func_02009230(int x) {
    int r = func_02008f9c(x, 0);
    func_02008c68(0, x, 0);
    return r;
}
