/* func_ov011_021cd60c: getter for 32-bit field at offset 0x268 of
 * the bss-resident data_ov011_021d3f20 struct.
 *
 *     ldr r0, =data_ov011_021d3f20
 *     ldr r0, [r0, #0x268]
 *     bx  lr
 *
 * Same pattern as ov005_021ad048. Extern as char[] so the literal
 * pool resolves to the dsd-tracked bss symbol.
 */

extern char data_ov011_021d3f20[];

int func_ov011_021cd60c(void) {
    return *(int *)(data_ov011_021d3f20 + 0x268);
}
