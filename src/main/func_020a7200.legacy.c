/* func_020a7200: 2 null guards, optional byte-out, boolean end-of-string test.
 *
 *     cmp r1, #0x0
 *     moveq r0, #0x0
 *     bxeq lr
 *     cmp r2, #0x0
 *     mvneq r0, #0x0
 *     bxeq lr
 *     cmp r0, #0x0
 *     ldrneb r2, [r1]
 *     strneh r2, [r0]
 *     ldrsb r0, [r1]
 *     cmp r0, #0x0
 *     moveq r0, #0x0
 *     movne r0, #0x1
 *     bx lr
 *
 * Leaf, no stack frame -- .legacy.c per C-71. Two DIFFERENT-variable
 * guards (r1 then r2), each a plain equality -> if-converted (moveq/
 * mvneq) rather than branch, matches plain if/return. Byte read at
 * *src happens twice with different signedness (unsigned for the
 * optional out-store, plain/signed char for the final !=0 test) --
 * `-char signed` makes plain char the signed one. The final boolean
 * needed a real `if (*src == 0) return 0; return 1;` -- a ternary
 * (either polarity) compiled the same two predicated movs in the
 * wrong order (movne before moveq; orig has moveq first).
 */

int func_020a7200(short *out, char *src, void *ctx) {
    if (src == 0) {
        return 0;
    }
    if (ctx == 0) {
        return -1;
    }
    if (out != 0) {
        *out = *(unsigned char *)src;
    }
    if (*src == 0) {
        return 0;
    }
    return 1;
}
