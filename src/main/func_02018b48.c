/* func_02018b48: hard-tier forwarder — getter for field at offset 0x814
 * in the state singleton returned by `func_02018b28` (a `data_02104f58`
 * backed global, shared by 189 callers across main).
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_5.s):
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_02018b28
 *     ldr   r0, [r0, #0x814]
 *     ldmia sp!, {r3, pc}
 *
 * 4 ARM instructions, 0x10 bytes. ARM's 12-bit load immediate range
 * fits 0x814 directly into the ldr without literal-pool help.
 */

extern char *func_02018b28(void);

int func_02018b48(void) {
    return *(int *)(func_02018b28() + 0x814);
}
