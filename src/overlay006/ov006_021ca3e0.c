/* func_ov006_021ca3e0: 2-u32 setter at offsets 0x38/0x3c, return 1.
 *
 *     str r1, [r0, #0x38]
 *     str r2, [r0, #0x3c]
 *     mov r0, #0x1
 *     bx  lr
 */

int func_ov006_021ca3e0(void *obj, int a, int b) {
    *(int *)((char *)obj + 0x38) = a;
    *(int *)((char *)obj + 0x3c) = b;
    return 1;
}
