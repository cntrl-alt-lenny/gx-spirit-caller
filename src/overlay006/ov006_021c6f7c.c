/* func_ov006_021c6f7c: u32 setter at offset 0x4c, return 1.
 *
 *     str r1, [r0, #0x4c]
 *     mov r0, #0x1
 *     bx  lr
 */

int func_ov006_021c6f7c(void *obj, int value) {
    *(int *)((char *)obj + 0x4c) = value;
    return 1;
}
