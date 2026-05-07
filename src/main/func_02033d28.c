/* func_02033d28: clear byte at *r0 if non-zero.
 *
 *     ldrb r1, [r0, #0x0]
 *     cmp  r1, #0x0
 *     movne r1, #0x0
 *     strneb r1, [r0, #0x0]
 *     bx   lr
 */

void func_02033d28(unsigned char *p) {
    if (*p != 0) *p = 0;
}
