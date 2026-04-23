/* func_ov006_021c6be8: hard-tier forwarder — calls func_0202ce24 with
 * the caller's arg, then returns 1 (success).
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_0202ce24
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

extern void func_0202ce24(void *x);

int func_ov006_021c6be8(void *x) {
    func_0202ce24(x);
    return 1;
}
