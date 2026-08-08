/* func_020a6afc: strcpy-like copy loop using signed-char reads. Leaf, no
 * stack frame.
 *
 *     ldrsb r2, [r1]
 *     mov   r3, r0
 *     cmp   r2, #0x0
 *     beq   .L_120
 *   .L_10c:
 *     ldrsb r2, [r1]
 *     strb  r2, [r0], #0x1
 *     ldrsb r2, [r1, #0x1]!
 *     cmp   r2, #0x0
 *     bne   .L_10c
 *   .L_120:
 *     mov   r1, #0x0
 *     strb  r1, [r0]
 *     mov   r0, r3
 *     bx    lr
 */

char *func_020a6afc(char *dst, volatile signed char *src) {
    char *result = dst;
    signed char c = *src;
    if (c != 0) {
        do {
            c = *src;
            *dst++ = c;
            c = *(++src);
        } while (c != 0);
    }
    *dst = 0;
    return result;
}
