/* func_0201b71c: return &state[0x8f4] — split-add because 0x8f4
 * doesn't fit ARM's 8-bit rotated immediate alone.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     add   r0, r0, #0xf4
 *     add   r0, r0, #0x800           ; 0x8f4 = 0xf4 + 0x800
 *     ldmia sp!, {r3, pc}
 *
 * 5 ARM instructions, 0x14 bytes. mwcc picks the two-add split when
 * the offset doesn't fit a single rotated-imm but its decomposition
 * into two rotated-imm pieces does.
 */

extern char *GetSystemWork(void);

char *func_0201b71c(void) {
    return GetSystemWork() + 0x8f4;
}
