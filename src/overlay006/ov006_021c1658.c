/* func_ov006_021c1658: u32 setter at offset 0xc, return 1.
 *
 *     str r1, [r0, #0xc]
 *     mov r0, #0x1
 *     bx  lr
 */

int func_ov006_021c1658(void *obj, int value) {
    *(int *)((char *)obj + 0xc) = value;
    return 1;
}
