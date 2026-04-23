/* func_020195ec: hard-tier bitfield-getter — extracts the nibble at
 * bits 12..15 of state[0x8d0] (a 4-bit field).
 *
 * Disassembly:
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     ldr   r0, [r0, #0x8d0]
 *     mov   r0, r0, lsl #0x10    ; (x << 16) then (x >> 28) extracts bits 12..15
 *     mov   r0, r0, lsr #0x1c
 *     ldmia sp!, {r3, pc}
 *
 * 6 ARM instructions, 0x18 bytes.
 */

extern char *GetSystemWork(void);

unsigned int func_020195ec(void) {
    int v = *(int *)(GetSystemWork() + 0x8d0);
    return (unsigned int)(v << 16) >> 28;
}
