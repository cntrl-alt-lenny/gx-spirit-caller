/* func_0201a3a0: hard-tier bit-clear — clears bits 24..31 (top byte)
 * of state[0x8e4]. Sibling of func_0201a388 (clears byte 2); both
 * operate on the same 32-bit word at offset 0x8e4.
 *
 * Disassembly:
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     ldr   r1, [r0, #0x8e4]
 *     bic   r1, r1, #0xff000000
 *     str   r1, [r0, #0x8e4]
 *     ldmia sp!, {r3, pc}
 *
 * 6 ARM instructions, 0x18 bytes.
 */

extern char *GetSystemWork(void);

void func_0201a3a0(void) {
    int *slot = (int *)(GetSystemWork() + 0x8e4);
    *slot &= ~0xff000000;
}
