/* func_02019124: hard-tier bitfield-getter — extracts byte 2
 * (bits 16..23, unsigned) of state[0x8d0].
 *
 * Disassembly:
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     ldr   r0, [r0, #0x8d0]
 *     mov   r0, r0, lsl #0x8     ; (x << 8) then (x >> 24) extracts bits 16..23
 *     mov   r0, r0, lsr #0x18
 *     ldmia sp!, {r3, pc}
 *
 * 6 ARM instructions, 0x18 bytes.
 */

extern char *GetSystemWork(void);

unsigned int func_02019124(void) {
    int v = *(int *)(GetSystemWork() + 0x8d0);
    return (unsigned int)(v << 8) >> 24;
}
