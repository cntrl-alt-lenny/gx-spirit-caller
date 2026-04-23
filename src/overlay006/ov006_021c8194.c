/* func_ov006_021c8194: 2-u32 setter at offsets 0x4c/0x50, return 1.
 *
 *     str r1, [r0, #0x4c]
 *     str r2, [r0, #0x50]
 *     mov r0, #0x1
 *     bx  lr
 */

int func_ov006_021c8194(void *obj, int a, int b) {
    *(int *)((char *)obj + 0x4c) = a;
    *(int *)((char *)obj + 0x50) = b;
    return 1;
}
