/* func_ov006_021c8184: 2-u32 setter at offsets 0x44/0x48, return 1.
 *
 *     str r1, [r0, #0x44]
 *     str r2, [r0, #0x48]
 *     mov r0, #0x1
 *     bx  lr
 */

int func_ov006_021c8184(void *obj, int a, int b) {
    *(int *)((char *)obj + 0x44) = a;
    *(int *)((char *)obj + 0x48) = b;
    return 1;
}
