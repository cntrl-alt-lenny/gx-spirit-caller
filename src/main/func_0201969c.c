/* func_0201969c: hard-tier bitfield-getter — signed top-byte extract
 * from state[0x8d4]. Paired with func_02019664 (byte-2 signed).
 *
 * Disassembly:
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_02018b28
 *     ldr   r0, [r0, #0x8d4]
 *     mov   r0, r0, asr #0x18    ; direct asr for top byte signed
 *     ldmia sp!, {r3, pc}
 *
 * 5 ARM instructions, 0x14 bytes.
 */

extern char *func_02018b28(void);

int func_0201969c(void) {
    int v = *(int *)(func_02018b28() + 0x8d4);
    return v >> 24;
}
