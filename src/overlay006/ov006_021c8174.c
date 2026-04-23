/* func_ov006_021c8174: 2-u32 setter at offsets 0x3c/0x40, return 1.
 *
 *     str r1, [r0, #0x3c]
 *     str r2, [r0, #0x40]
 *     mov r0, #0x1
 *     bx  lr
 */

int func_ov006_021c8174(void *obj, int a, int b) {
    *(int *)((char *)obj + 0x3c) = a;
    *(int *)((char *)obj + 0x40) = b;
    return 1;
}
