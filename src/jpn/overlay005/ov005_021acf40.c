/* func_ov005_021acf40: loads a 32-bit field at offset 0x10 of the
 * bss-resident data_ov005_021b1d4c block.
 *
 *     ldr r0, =data_ov005_021b1d4c
 *     ldr r0, [r0, #0x10]
 *     bx  lr
 *
 * data_ov005_021b1d4c is declared as a .bss symbol in
 * config/eur/arm9/overlays/ov005/symbols.txt; we take its address via
 * a char[] extern so the linker fills in the literal pool entry.
 */

extern char data_ov005_021b1d4c[];

int func_ov005_021acf40(void) {
    return *(int *)(data_ov005_021b1d4c + 0x10);
}
