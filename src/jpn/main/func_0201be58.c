/* func_0201be58: hard-tier forwarder — getter for field at offset 0x918
 * in the state singleton returned by `GetSystemWork`. Sibling of
 * func_02018f4c/func_02018f5c — the 0x918/0x91c/0x920 triple are
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

int func_0201be58(void) {
    return *(int *)(GetSystemWork() + 0x918);
}
