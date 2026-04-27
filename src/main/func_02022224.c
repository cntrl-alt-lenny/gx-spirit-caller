/* func_02022224: returns the value stored at `data_02197434`. Likely
 * a global singleton pointer — the bss slot holds a pointer loaded
 * and returned verbatim.
 *
 *     ldr r0, .L_020498fc
 *     ldr r0, [r0, #0x0]
 *     bx  lr
 *   .L_020498fc: .word data_02197434
 *
 * 3 ARM instructions + 1 literal-pool word, 0x10 bytes.
 */

extern void *data_02197434;

void *func_02022224(void) {
    return data_02197434;
}
