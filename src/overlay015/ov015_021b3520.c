/* func_ov015_021b3520: 32-bit setter at offset 0x5c of struct r0.
 *
 *     str r1, [r0, #0x5c]
 *     bx  lr
 *
 * Paired with the getter at 0x021b2488 (same offset, opposite
 * direction) — probably the setter half of a single field pair.
 */

void func_ov015_021b3520(void *p, int v) {
    *(int *)((char *)p + 0x5c) = v;
}
