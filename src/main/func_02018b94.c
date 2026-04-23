/* func_02018b94: hard-tier forwarder — returns &state[0x810] as a raw
 * pointer (distinct from the 0x814 getter at `func_02018b48` which
 * dereferences). Likely a sub-struct address-taker.
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_5.s):
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     add   r0, r0, #0x810
 *     ldmia sp!, {r3, pc}
 *
 * 4 ARM instructions, 0x10 bytes. `add` with a rotated-immediate
 * encodes 0x810 = 0x81 ror 28 in one instruction.
 */

extern char *GetSystemWork(void);

char *func_02018b94(void) {
    return GetSystemWork() + 0x810;
}
