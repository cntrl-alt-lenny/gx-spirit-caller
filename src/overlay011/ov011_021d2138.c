/* func_ov011_021d2138: insert u16 into upper 16 bits of obj[0xc].
 *
 *     mov r2, #0x10000             ; load 0x10000 (will negate)
 *     ldr r3, [r0, #0xc]
 *     rsb r2, r2, #0x0             ; r2 = -0x10000 = 0xffff0000
 *     and r2, r3, r2               ; ← wait that's 0xffff0000 mask, but the clear
 *                                  ;   should be "clear upper 16 bits" so mask = 0xffff
 *     mov r1, r1, lsl #0x10
 *     orr r1, r2, r1, lsr #0x10    ; ...
 *     str r1, [r0, #0xc]
 *     bx  lr
 *
 * Let me re-read: `rsb r2, r2, #0x0` = 0 - 0x10000 = -0x10000 = 0xffff0000
 * (as u32). Then `and r2, r3, r2` = r3 & 0xffff0000 = KEEP upper 16 bits,
 * clear lower 16. Then `r1 = value << 16 >> 16 = value & 0xffff`, and
 * `orr r1, r2, r1` → upper16 (from obj[0xc]) | (value & 0xffff). So
 * this inserts value into the LOWER 16 bits, not upper.
 *
 * mwcc emits `mov #0x10000; rsb r2, r2, #0` instead of `mov r2, #0xffff0000`
 * because 0xffff0000 doesn't fit ARM's 8-bit rotated-immediate encoding
 * while 0x10000 does (0x1 ror 28). The rsb-negate dance materializes
 * the constant in 2 insns instead of requiring a literal pool.
 */

void func_ov011_021d2138(unsigned int *obj, unsigned int value) {
    obj[3] = (obj[3] & 0xffff0000) | (value & 0xffff);
}
