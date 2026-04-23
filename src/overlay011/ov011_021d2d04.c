/* func_ov011_021d2d04: sibling of ov011_021d2c94 — 2-word copy with
 * src offsets 0x2c and 0x30 (instead of 0 and 4).
 *
 *     ldr r3, [r0, #0x2c]
 *     str r3, [r1, #0x0]
 *     ldr r0, [r0, #0x30]
 *     str r0, [r2, #0x0]
 *     bx  lr
 */

void func_ov011_021d2d04(char *src, int *dst0, int *dst1) {
    *dst0 = *(int *)(src + 0x2c);
    *dst1 = *(int *)(src + 0x30);
}
