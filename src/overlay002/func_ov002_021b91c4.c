/* func_ov002_021b91c4: 1-word copy through pointer.
 *
 *     ldr r1, [r1]    ; r1 = *src
 *     str r1, [r0]    ; *dst = r1
 *     bx  lr
 *
 * 5 callers in ov002 — generic *dst = *src helper. Signature inferred
 * from the load-then-store shape; types kept as int* for word-level
 * semantics.
 */

void func_ov002_021b91c4(int *dst, const int *src) {
    *dst = *src;
}
