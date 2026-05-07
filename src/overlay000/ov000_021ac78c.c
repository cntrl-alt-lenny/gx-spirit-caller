/* func_ov000_021ac78c: bitfield insert combined with bic — clear bit 2
 * + clear bits 3..6 + insert low bit at bit 2.
 *
 *     ldr r2, [r0, #0x0]
 *     mov r1, r1, lsl #0x1f       ; arg << 31 (keep bit 0)
 *     bic r2, r2, #0x4             ; clear bit 2
 *     orr r1, r2, r1, lsr #0x1d    ; r1 = r2 | (r1 >> 29) → bit 2
 *     bic r1, r1, #0x78            ; clear bits 3..6
 *     str r1, [r0, #0x0]
 *     bx  lr
 *
 * Combines a bitfield insert at bit 2 with a separate bic clearing
 * bits 3..6 — equivalent to clearing bits 2..6 first then setting
 * bit 2 from arg's low bit.
 */

void func_ov000_021ac78c(unsigned int *p, unsigned int arg) {
    unsigned int v = *p;
    v = (v & ~0x4u) | ((arg << 31) >> 29);
    v &= ~0x78u;
    *p = v;
}
