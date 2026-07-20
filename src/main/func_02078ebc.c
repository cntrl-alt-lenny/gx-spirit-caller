/* func_02078ebc: sets r1 as a side-output (loaded u16) with r0 as the
 * nominal return value (always 0) -- a two-register-output ABI with
 * no C return-type slot for the second value, not expressible in
 * portable C.
 */

asm void func_02078ebc(void) {
    nofralloc
    ldrh    r1, [r0, #0x0]
    mov     r0, #0x0
    bx      lr
}
