/* func_02018f5c: hard-tier forwarder — getter for field at offset 0x920
 * in the state singleton returned by `GetSystemWork`. Sibling of
 * func_02018f4c (0x91c) — adjacent u32 fields in the same struct.
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_5.s):
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     ldr   r0, [r0, #0x920]
 *     ldmia sp!, {r3, pc}
 *
 * 4 ARM instructions, 0x10 bytes.
 */

extern char *GetSystemWork(void);

int func_02018f5c(void) {
    return *(int *)(GetSystemWork() + 0x920);
}
