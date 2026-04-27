/* func_02054bfc: returns the value stored at `data_0219e4d0`. Likely
 * a global singleton pointer — the bss slot holds a pointer loaded
 * and returned verbatim.
 *
 *     ldr r0, .L_020498fc
 *     ldr r0, [r0, #0x0]
 *     bx  lr
 *   .L_020498fc: .word data_0219e4d0
 *
 * 3 ARM instructions + 1 literal-pool word, 0x10 bytes.
 */

extern void *data_0219e4d0;

void *func_02054bfc(void) {
    return data_0219e4d0;
}
