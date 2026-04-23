/* func_02018f90: hard-tier forwarder — getter for field at offset 0x920
 * in the state singleton returned by `func_02018b28`. Sibling of
 * func_02018f80 (0x91c) — adjacent u32 fields in the same struct.
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_5.s):
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_02018b28
 *     ldr   r0, [r0, #0x920]
 *     ldmia sp!, {r3, pc}
 *
 * 4 ARM instructions, 0x10 bytes.
 */

extern char *func_02018b28(void);

int func_02018f90(void) {
    return *(int *)(func_02018b28() + 0x920);
}
