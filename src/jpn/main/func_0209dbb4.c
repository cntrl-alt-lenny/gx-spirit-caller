/* func_0209dbb4: returns the value stored at `data_021a8c4c`. Likely
 * a global singleton pointer — the bss slot holds a pointer loaded
 * and returned verbatim.
 *
 *     ldr r0, .L_020498fc
 *     ldr r0, [r0, #0x0]
 *     bx  lr
 *   .L_020498fc: .word data_021a8c4c
 *
 * 3 ARM instructions + 1 literal-pool word, 0x10 bytes.
 */

extern void *data_021a8c4c;

void *func_0209dbb4(void) {
    return data_021a8c4c;
}
