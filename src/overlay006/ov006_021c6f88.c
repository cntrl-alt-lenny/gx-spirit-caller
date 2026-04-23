/* func_ov006_021c6f88: u32 setter at offset 0x50, return 1.
 *
 *     str r1, [r0, #0x50]
 *     mov r0, #0x1
 *     bx  lr
 */

int func_ov006_021c6f88(void *obj, int value) {
    *(int *)((char *)obj + 0x50) = value;
    return 1;
}
