/* func_020206b8: 5-arg call promoter with 4 fixed constants.
 * Calls func_020a0630(arg0, 3, 0x11, arg1, 0x1e). Style B.
 *
 *     stmdb sp!, {r3, lr}
 *     mov   r3, r1                       ; r3 = arg1 (4th arg)
 *     mov   ip, #0x1e
 *     mov   r1, #0x3
 *     mov   r2, #0x11
 *     str   ip, [sp, #0x0]                ; arg5 on stack
 *     bl    func_020a0630
 *     ldmia sp!, {r3, pc}
 */

extern int func_020a0630(int a, int b, int c, int d, int e);

int func_020206b8(int a, int b) {
    return func_020a0630(a, 3, 0x11, b, 0x1e);
}
