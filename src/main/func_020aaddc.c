/* func_020aaddc: signed-byte strlen — counts bytes until the
 * NUL terminator.
 *
 *     mvn r2, #0x0           ; r2 = -1 (counter starts before first byte)
 *  .L_020aade0:
 *     ldrsb r1, [r0], #0x1   ; r1 = (signed)*r0; r0 += 1
 *     add r2, r2, #0x1
 *     cmp r1, #0x0
 *     bne .L_020aade0
 *     mov r0, r2             ; return r2
 *     bx  lr
 *
 * `ldrsb` (signed byte load) is mwcc's emit when the source pointer
 * is `char *` with `-char signed` (the project default).
 */

int func_020aaddc(const char *s) {
    int n = -1;
    do {
        n++;
    } while (*s++);
    return n;
}
