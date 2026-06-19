/* func_ov002_02222524: hard-tier forwarder — calls func_ov002_021e282c with
 * the caller's arg, then returns 0. Classic "delegate and report
 * failure/default" shape.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov002_021e282c
 *     mov   r0, #0x0
 *     ldmia sp!, {r3, pc}
 */

extern void func_ov002_021e282c(void *x);

int func_ov002_02222524(void *x) {
    func_ov002_021e282c(x);
    return 0;
}
