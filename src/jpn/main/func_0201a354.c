/* func_0201a354: hard-tier bit-clear — clears bits 16..23 of
 * state[0x8e4] (byte 2 of the 32-bit word).
 *
 * Disassembly:
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     ldr   r1, [r0, #0x8e4]
 *     bic   r1, r1, #0xff0000    ; 0xff0000 = rotated-immediate
 *     str   r1, [r0, #0x8e4]
 *     ldmia sp!, {r3, pc}
 *
 * 6 ARM instructions, 0x18 bytes. mwcc-ARM emits `bic` rather than
 * `and` when the negated form fits a rotated immediate, which 0xff0000
 * does (0xff rotated by 16).
 */

extern char *GetSystemWork(void);

void func_0201a354(void) {
    int *slot = (int *)(GetSystemWork() + 0x8e4);
    *slot &= ~0xff0000;
}
