/* func_02078ed8: packs two u16 fields into a u32 (hi | lo<<16), but
 * the original ALSO reads a third u16 (at offset 0) whose value never
 * appears in the result -- a dead-looking load a plain
 * `return hi | (lo << 16);` won't reproduce (confirmed: mwcc
 * eliminates it, landing 3 insns instead of the original's 4). Ships
 * as asm to match exactly rather than guess the source shape that
 * keeps a provably-unused read alive.
 */

asm void func_02078ed8(void) {
    nofralloc
    ldrh    r1, [r0, #0x0]
    ldrh    r2, [r0, #-0x2]
    ldrh    r3, [r0, #-0x4]
    orr     r0, r3, r2, lsl #0x10
    bx      lr
}
