/* func_ov015_021b287c: two-field setter at offsets 0x14 and 0x18.
 *
 *     str r1, [r0, #0x14]
 *     str r2, [r0, #0x18]
 *     bx  lr
 */

void func_ov015_021b287c(void *p, int v1, int v2) {
    *(int *)((char *)p + 0x14) = v1;
    *(int *)((char *)p + 0x18) = v2;
}
