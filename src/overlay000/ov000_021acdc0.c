/* func_ov000_021acdc0: two-field setter at offsets 0x80 and 0x84.
 *
 *     str r1, [r0, #0x80]
 *     str r2, [r0, #0x84]
 *     bx  lr
 */

void func_ov000_021acdc0(void *p, int a, int b) {
    *(int *)((char *)p + 0x80) = a;
    *(int *)((char *)p + 0x84) = b;
}
