/* func_ov002_0220e74c: hard-tier forwarder — calls func_ov002_0220e518 with
 * the caller's arg, then returns 0. Classic "delegate and report
 * failure/default" shape.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov002_0220e518
 *     mov   r0, #0x0
 *     ldmia sp!, {r3, pc}
 */

extern void func_ov002_0220e518(void *x);

int func_ov002_0220e74c(void *x) {
    func_ov002_0220e518(x);
    return 0;
}
