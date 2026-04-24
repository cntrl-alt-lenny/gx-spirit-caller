/* func_020335c8: 2-u32 setter at offsets 0xe98 and 0xe9c.
 *
 *     str r1, [r0, #0xe98]
 *     str r2, [r0, #0xe9c]
 *     bx  lr
 */

void func_020335c8(void *obj, int a, int b) {
    *(int *)((char *)obj + 0xe98) = a;
    *(int *)((char *)obj + 0xe9c) = b;
}
