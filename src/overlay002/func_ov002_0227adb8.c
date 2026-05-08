/* func_ov002_0227adb8: 5-arg call with arg3 promoted to stack
 * arg4 and constant 2 substituted in r3. Style B with r3-spill.
 *
 *     stmdb sp!, {r3, lr}
 *     str   r3, [sp, #0x0]               ; arg3 → stack arg4
 *     mov   r3, #0x2
 *     bl    func_ov002_0227ac64           ; (a, b, c, 2, arg3)
 *     ldmia sp!, {r3, pc}
 */

extern int func_ov002_0227ac64(int a, int b, int c, int d, int e);

int func_ov002_0227adb8(int a, int b, int c, int d) {
    return func_ov002_0227ac64(a, b, c, 2, d);
}
