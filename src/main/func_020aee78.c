/* func_020aee78: wcschr-like search over a null-terminated u16 array.
 * Leaf, no stack frame.
 *
 *     ldrh r2, [r0], #0x2
 *     cmp  r2, #0x0
 *     beq  .L_24
 *   .L_c:
 *     cmp  r2, r1
 *     subeq r0, r0, #0x2
 *     bxeq lr
 *     ldrh r2, [r0], #0x2
 *     cmp  r2, #0x0
 *     bne  .L_c
 *   .L_24:
 *     cmp  r1, #0x0
 *     movne r0, #0x0
 *     subeq r0, r0, #0x2
 *     bx   lr
 */

unsigned short *func_020aee78(unsigned short *str, unsigned short needle) {
    unsigned short c = *str++;
    if (c != 0) {
        do {
            if (c == needle) return str - 1;
            c = *str++;
        } while (c != 0);
    }
    if (needle != 0) return 0;
    return str - 1;
}
