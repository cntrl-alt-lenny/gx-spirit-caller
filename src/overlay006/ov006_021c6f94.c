/* func_ov006_021c6f94: u32 setter at offset 0x54, return 1.
 *
 *     str r1, [r0, #0x54]
 *     mov r0, #0x1
 *     bx  lr
 */

int func_ov006_021c6f94(void *obj, int value) {
    *(int *)((char *)obj + 0x54) = value;
    return 1;
}
