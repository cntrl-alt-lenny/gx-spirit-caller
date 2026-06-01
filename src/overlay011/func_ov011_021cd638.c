/* func_ov011_021cd638: when the +0x2a0 mode word is 1, run the two
 * per-frame update passes.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r0, =data_ov011_021d4000
 *     ldr   r0, [r0, #0x2a0]
 *     cmp   r0, #0x1
 *     ldmneia sp!, {r3, pc}
 *     bl    func_ov011_021cd35c
 *     bl    func_ov011_021cd574
 *     ldmia sp!, {r3, pc}
 */

extern char data_ov011_021d4000[];
extern void func_ov011_021cd35c(void);
extern void func_ov011_021cd574(void);

void func_ov011_021cd638(void) {
    if (*(int *)(data_ov011_021d4000 + 0x2a0) != 1) return;
    func_ov011_021cd35c();
    func_ov011_021cd574();
}
