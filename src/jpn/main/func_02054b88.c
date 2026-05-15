/* func_02054b88: returns the value stored at `data_0219e3f0`. Likely
 * a global singleton pointer — the bss slot holds a pointer loaded
 * and returned verbatim.
 *
 *     ldr r0, .L_020498fc
 *     ldr r0, [r0, #0x0]
 *     bx  lr
 *   .L_020498fc: .word data_0219e3f0
 *
 * 3 ARM instructions + 1 literal-pool word, 0x10 bytes.
 */

extern void *data_0219e3f0;

void *func_02054b88(void) {
    return data_0219e3f0;
}
