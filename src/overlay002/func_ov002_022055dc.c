/* func_ov002_022055dc: helper-call + bool.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r0, .L_022055f8           ; 0x159d
 *     bl    func_ov002_021bb91c
 *     cmp   r0, #0x0
 *     movne r0, #0x1
 *     moveq r0, #0x0
 *     ldmia sp!, {r3, pc}
 */

extern int func_ov002_021bb91c(int magic);

int func_ov002_022055dc(void) {
    return func_ov002_021bb91c(0x159d) != 0;
}
