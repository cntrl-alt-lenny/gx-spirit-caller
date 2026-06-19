/* func_ov011_021cfa60: set the +0x2bc bit26 field, refresh the +0x2b0 blend
 * via func_ov011_021cfa34(1), then set the +0x2b0 field bits to 0x18000.
 *
 *     ldr   r2, =data_ov011_021d3f20 ; ldr r1, =0x807fffff
 *     ldr   r3, [r2, #0x2bc] ; mov r0, #0x1
 *     and   r1, r3, r1 ; orr r1, r1, #0x4000000 ; str r1, [r2, #0x2bc]
 *     bl    func_ov011_021cfa34
 *     ldr   r1, =data_ov011_021d3f20 ; ldr r0, =0xffe01fff
 *     ldr   r2, [r1, #0x2b0] ; and r0, r2, r0 ; orr r0, r0, #0x18000 ; str r0, [r1, #0x2b0]
 *     ldmia sp!, {r3, pc}
 */

extern char data_ov011_021d3f20[];
extern void func_ov011_021cfa34(int v);

void func_ov011_021cfa60(void) {
    *(int *)(data_ov011_021d3f20 + 0x2bc) =
        (*(int *)(data_ov011_021d3f20 + 0x2bc) & 0x807fffff) | 0x4000000;
    func_ov011_021cfa34(1);
    *(int *)(data_ov011_021d3f20 + 0x2b0) =
        (*(int *)(data_ov011_021d3f20 + 0x2b0) & 0xffe01fff) | 0x18000;
}
