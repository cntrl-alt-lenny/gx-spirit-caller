/* func_0200b1ec: 3-arg shuffle thunk. Calls func_0209445c(b, a,
 * c<<2) and returns 1.
 *
 *     stmdb sp!, {r3, lr}
 *     mov   r3, r0
 *     mov   r0, r1
 *     mov   r1, r3
 *     mov   r2, r2, lsl #0x2
 *     bl    func_0209445c
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

extern int func_0209445c(int x, int y, int z);

int func_0200b1ec(int a, int b, int c) {
    func_0209445c(b, a, c << 2);
    return 1;
}
