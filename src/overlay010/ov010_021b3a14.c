/* func_ov010_021b3a14: 32-bit setter at offset 0x5c of struct r0.
 *
 *     str r1, [r0, #0x5c]
 *     bx  lr
 *
 * Semantically equivalent to func_ov015_021b3520 (same body, different
 * address in the overlay-swap region).
 */

void func_ov010_021b3a14(void *p, int v) {
    *(int *)((char *)p + 0x5c) = v;
}
