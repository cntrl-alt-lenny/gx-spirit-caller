/* func_0200b20c: arg-shuffle + multiply by 0x68 + tail-call.
 * Same shape as func_0200b178 (already matched), different multiplier.
 *
 *     push  {r3, lr}
 *     mov   r3, #0x68
 *     mul   r3, r2, r3
 *     mov   r2, r0
 *     mov   r0, r1
 *     mov   r1, r2
 *     mov   r2, r3
 *     bl    func_0209445c
 *     mov   r0, #0x1
 *     pop   {r3, pc}
 */

extern void func_0209445c(int x, int y, int z);

int func_0200b20c(int a, int b, int c) {
    func_0209445c(b, a, c * 0x68);
    return 1;
}
