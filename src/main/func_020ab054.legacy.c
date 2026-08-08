/* func_020ab054: strncmp. Leaf, no stack frame.
 *
 *     cmp  r2, #0x0
 *     beq  .L_288
 *   .L_264:
 *     ldrb ip, [r1], #0x1
 *     ldrb r3, [r0], #0x1
 *     cmp  r3, ip
 *     subne r0, r3, ip
 *     bxne lr
 *     cmp  r3, #0x0
 *     beq  .L_288
 *     subs r2, r2, #0x1
 *     bne  .L_264
 *   .L_288:
 *     mov  r0, #0x0
 *     bx   lr
 */

int func_020ab054(unsigned char *s1, unsigned char *s2, int n) {
    if (n == 0) goto ret_zero;
    do {
        unsigned char c2 = *s2++;
        unsigned char c1 = *s1++;
        if (c1 != c2) return c1 - c2;
        if (c1 == 0) goto ret_zero;
        n--;
    } while (n != 0);
ret_zero:
    return 0;
}
