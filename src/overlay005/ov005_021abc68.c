/* func_ov005_021abc68: two-field setter at offsets 0x30 and 0x34.
 *
 *     str r1, [r0, #0x30]
 *     str r2, [r0, #0x34]
 *     bx  lr
 *
 * Writes `a` to obj+0x30 and `b` to obj+0x34. Likely a pair of
 * adjacent int32 fields (width/height, x/y, etc.).
 */

void func_ov005_021abc68(void *obj, int a, int b) {
    *(int *)((char *)obj + 0x30) = a;
    *(int *)((char *)obj + 0x34) = b;
}
