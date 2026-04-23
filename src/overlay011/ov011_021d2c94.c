/* func_ov011_021d2c94: 2-word copy from *src into (*dst0, *dst1).
 *
 *     ldr r3, [r0, #0x0]
 *     str r3, [r1, #0x0]
 *     ldr r0, [r0, #0x4]
 *     str r0, [r2, #0x0]
 *     bx  lr
 *
 * Reads `src[0]` → `*dst0`, `src[1]` → `*dst1`. mwcc interleaves
 * the second load between the first store and second store, same
 * load-then-store rhythm the baserom shows.
 */

void func_ov011_021d2c94(int *src, int *dst0, int *dst1) {
    *dst0 = src[0];
    *dst1 = src[1];
}
