/* func_0200b178: arg-shuffle + multiply + tail-call.
 *
 *     push  {r3, lr}
 *     mov   r3, #0x58
 *     mul   r3, r2, r3            ; r3 = c * 0x58
 *     mov   r2, r0                ; r2 = a (saved)
 *     mov   r0, r1                ; r0 = b
 *     mov   r1, r2                ; r1 = a
 *     mov   r2, r3                ; r2 = c * 0x58
 *     bl    func_0209445c
 *     mov   r0, #0x1
 *     pop   {r3, pc}
 */

extern void func_0209445c(int x, int y, int z);

int func_0200b178(int a, int b, int c) {
    func_0209445c(b, a, c * 0x58);
    return 1;
}
