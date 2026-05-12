/* func_ov011_021d0e58: bitfield write into row[idx].f_8. Clears bits
 * 19..26 (mask 0x07f80000) and OR-in val's low byte at position 19.
 * Wave-18 lesson: omit redundant mask on the shifted-val side so mwcc
 * fuses the lsr into the orr.
 *
 *     ldr   r3, .L_021d0e80           ; data_021d4660
 *     mov   r2, #0x28
 *     mla   r3, r0, r2, r3
 *     ldr   r2, [r3, #0x8]
 *     ldr   r0, .L_021d0e84           ; 0xf807ffff
 *     mov   r1, r1, lsl #0x18
 *     and   r0, r2, r0
 *     orr   r0, r0, r1, lsr #0x5
 *     str   r0, [r3, #0x8]
 *     bx    lr
 */

extern char data_ov011_021d4660[];

void func_ov011_021d0e58(int idx, unsigned int val) {
    unsigned int *p = (unsigned int *)(data_ov011_021d4660 + idx * 0x28 + 0x8);
    *p = (*p & 0xf807ffffu) | ((val << 24) >> 5);
}
