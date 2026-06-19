/* func_ov002_022082a4: helper-call + bool-inverse.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r0, .L_022083b0           ; 0x13f2
 *     bl    func_ov002_021baf88
 *     cmp   r0, #0x0
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     ldmia sp!, {r3, pc}
 */

extern int func_ov002_021baf88(int magic);

int func_ov002_022082a4(void) {
    return func_ov002_021baf88(0x13f2) == 0;
}
