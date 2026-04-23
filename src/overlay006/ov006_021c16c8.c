/* func_ov006_021c16c8: hard-tier forwarder — calls func_ov006_021c17c8 with
 * the caller's arg, then returns 1 (success).
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov006_021c17c8
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

extern void func_ov006_021c17c8(void *x);

int func_ov006_021c16c8(void *x) {
    func_ov006_021c17c8(x);
    return 1;
}
