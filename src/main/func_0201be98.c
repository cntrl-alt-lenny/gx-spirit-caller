/* func_0201be98: hard-tier forwarder — getter for field at offset 0x918
 * in the state singleton returned by `GetSystemWork`. Sibling of
 * func_02018f80/func_02018f90 — the 0x918/0x91c/0x920 triple are
 * adjacent u32 fields in the same struct.
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_5.s):
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     ldr   r0, [r0, #0x918]
 *     ldmia sp!, {r3, pc}
 *
 * 4 ARM instructions, 0x10 bytes.
 */

extern char *GetSystemWork(void);

int func_0201be98(void) {
    return *(int *)(GetSystemWork() + 0x918);
}
