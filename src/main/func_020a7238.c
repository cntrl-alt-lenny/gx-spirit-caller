/* func_020a7238: null-checked byte store + bool return.
 *
 *     cmp r0, #0x0
 *     moveq r0, #0x0
 *     strneb r1, [r0, #0x0]
 *     movne r0, #0x1
 *     bx  lr
 *
 * Returns 1 if pointer was non-null and the store succeeded, 0 if null.
 */

int func_020a7238(unsigned char *p, unsigned char b) {
    if (p == 0) return 0;
    *p = b;
    return 1;
}
