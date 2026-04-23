/* func_ov006_021ca3f0: 2-u32 setter at offsets 0x40/0x44, return 1.
 *
 *     str r1, [r0, #0x40]
 *     str r2, [r0, #0x44]
 *     mov r0, #0x1
 *     bx  lr
 */

int func_ov006_021ca3f0(void *obj, int a, int b) {
    *(int *)((char *)obj + 0x40) = a;
    *(int *)((char *)obj + 0x44) = b;
    return 1;
}
