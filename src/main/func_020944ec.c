/* func_020944ec: drain a buffer into a fixed hardware port — reads
 * 4-byte words from an incrementing r0 and writes each to a FIXED r1
 * (no post-increment on the store, unlike Copy32's dst++). Ships as
 * asm for the same store-multiple-idiom reason as Copy32/Fill32.
 */

asm void func_020944ec(void) {
    nofralloc
    add     ip, r0, r2
loop_top:
    cmp     r0, ip
    ldmltia r0!, {r2}
    strlt   r2, [r1, #0x0]
    blt     loop_top
    bx      lr
}
