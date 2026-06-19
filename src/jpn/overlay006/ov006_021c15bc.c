/* func_ov006_021c15bc: hard-tier forwarder — calls func_ov006_021c16bc with
 * the caller's arg, then returns 1 (success).
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov006_021c16bc
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

extern void func_ov006_021c16bc(void *x);

int func_ov006_021c15bc(void *x) {
    func_ov006_021c16bc(x);
    return 1;
}
