/* func_0200093c: 4-byte-stride memory fill, identical body to Fill32.
 * Ships as asm rather than natural C for the same reason: mwcc doesn't
 * emit the stmltia (predicated store-multiple, single register) form.
 */

asm void func_0200093c(void) {
    nofralloc
    add     ip, r1, r2
loop_top:
    cmp     r1, ip
    stmltia r1!, {r0}
    blt     loop_top
    bx      lr
}
