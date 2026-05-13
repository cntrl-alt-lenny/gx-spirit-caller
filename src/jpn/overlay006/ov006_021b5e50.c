/* func_ov006_021b5e50: hard-tier forwarder — calls func_ov006_021b8c6c with
 * the caller's arg, then returns 1 (success).
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov006_021b8c6c
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

extern void func_ov006_021b8c6c(void *x);

int func_ov006_021b5e50(void *x) {
    func_ov006_021b8c6c(x);
    return 1;
}
