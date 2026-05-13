/* func_ov002_021bbe8c: helper-call + signed-bool (return 1 iff ≥ 0).
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r1, .L_021bbea8           ; 0x12be
 *     bl    func_ov002_021bac38
 *     cmp   r0, #0x0
 *     movge r0, #0x1
 *     movlt r0, #0x0
 *     ldmia sp!, {r3, pc}
 */

extern int func_ov002_021bac38(int a, int b);

int func_ov002_021bbe8c(int arg) {
    return func_ov002_021bac38(arg, 0x12be) >= 0;
}
