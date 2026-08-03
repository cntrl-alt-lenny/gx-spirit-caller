/* func_02079e4c: population count (number of set bits in x), via a
 * clear-highest-bit loop using `clz`. Ships as asm -- mwcc 2.0 has no
 * popcount/clz idiom recognition, so no natural C loop reliably emits
 * the `clz` instruction itself.
 */

asm int func_02079e4c(unsigned int x) {
    nofralloc
    mov r1, r0
    mov r0, #0x0
    mov r3, #0x1
loop:
    clz r2, r1
    rsbs r2, r2, #0x1f
    bxcc lr
    bic r1, r1, r3, lsl r2
    add r0, r0, #0x1
    b loop
}
