/* func_02019668: hard-tier bitfield-getter — signed top-byte extract
 * from state[0x8d4]. Paired with func_02019630 (byte-2 signed).
 *
 * Disassembly:
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     ldr   r0, [r0, #0x8d4]
 *     mov   r0, r0, asr #0x18    ; direct asr for top byte signed
 *     ldmia sp!, {r3, pc}
 *
 * 5 ARM instructions, 0x14 bytes.
 */

extern char *GetSystemWork(void);

int func_02019668(void) {
    int v = *(int *)(GetSystemWork() + 0x8d4);
    return v >> 24;
}
