/* func_0200b208: 3-arg shuffle thunk. Calls func_02094550(b, a,
 * c<<2) and returns 1.
 *
 *     stmdb sp!, {r3, lr}
 *     mov   r3, r0
 *     mov   r0, r1
 *     mov   r1, r3
 *     mov   r2, r2, lsl #0x2
 *     bl    func_02094550
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

extern int func_02094550(int x, int y, int z);

int func_0200b208(int a, int b, int c) {
    func_02094550(b, a, c << 2);
    return 1;
}
