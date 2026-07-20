/* func_0209b534: poll data_021a8438 (u32) until it's no longer 1.
 * Natural C (`while (*p == 1) {}`) picks r0 for the base pointer;
 * the original uses ip -- a register-choice mismatch, not a real
 * codegen gap, but ships as asm to match exactly.
 */

extern char data_021a8438[];

asm void func_0209b534(void) {
    nofralloc
    ldr     ip, =data_021a8438
loop_top:
    ldr     r0, [ip, #0x0]
    cmp     r0, #0x1
    beq     loop_top
    bx      lr
}
