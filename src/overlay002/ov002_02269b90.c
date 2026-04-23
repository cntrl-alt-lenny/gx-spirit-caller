/* func_ov002_02269b90: hard-tier forwarder — calls func_ov002_02269ab8 with
 * the caller's arg, then returns 0. Classic "delegate and report
 * failure/default" shape.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov002_02269ab8
 *     mov   r0, #0x0
 *     ldmia sp!, {r3, pc}
 */

extern void func_ov002_02269ab8(void *x);

int func_ov002_02269b90(void *x) {
    func_ov002_02269ab8(x);
    return 0;
}
