/* func_02018f80: hard-tier forwarder — getter for field at offset 0x91c
 * in the state singleton returned by `func_02018b28`.
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_5.s):
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_02018b28
 *     ldr   r0, [r0, #0x91c]
 *     ldmia sp!, {r3, pc}
 *
 * 4 ARM instructions, 0x10 bytes.
 */

extern char *func_02018b28(void);

int func_02018f80(void) {
    return *(int *)(func_02018b28() + 0x91c);
}
