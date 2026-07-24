/* func_02099b44: poll data_021a82b4+0x36 (u16) against a mask until
 * clear. Natural C (`while (*field & mask) {}`) compiles to a
 * separate `and`+`cmp` pair; the original fuses them into a single
 * `ands` -- same family of unreachable-from-C codegen as
 * func_020414d0. Ships as asm to match exactly.
 */

extern char data_021a82b4[];

asm void func_02099b44(void) {
    nofralloc
    ldr     r1, =data_021a82b4
loop_top:
    ldrh    r2, [r1, #0x36]
    ands    r2, r2, r0
    bne     loop_top
    bx      lr
}
