/* func_ov011_021cd574: when the +0x2a0 mode word is 1, run the two
 * per-frame update passes.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r0, =data_ov011_021d3f20
 *     ldr   r0, [r0, #0x2a0]
 *     cmp   r0, #0x1
 *     ldmneia sp!, {r3, pc}
 *     bl    func_ov011_021cd298
 *     bl    func_ov011_021cd4b0
 *     ldmia sp!, {r3, pc}
 */

extern char data_ov011_021d3f20[];
extern void func_ov011_021cd298(void);
extern void func_ov011_021cd4b0(void);

void func_ov011_021cd574(void) {
    if (*(int *)(data_ov011_021d3f20 + 0x2a0) != 1) return;
    func_ov011_021cd298();
    func_ov011_021cd4b0();
}
