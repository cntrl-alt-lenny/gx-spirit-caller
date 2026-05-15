/* func_02018f4c: hard-tier forwarder — getter for field at offset 0x91c
 * in the state singleton returned by `GetSystemWork`.
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_5.s):
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     ldr   r0, [r0, #0x91c]
 *     ldmia sp!, {r3, pc}
 *
 * 4 ARM instructions, 0x10 bytes.
 */

extern char *GetSystemWork(void);

int func_02018f4c(void) {
    return *(int *)(GetSystemWork() + 0x91c);
}
