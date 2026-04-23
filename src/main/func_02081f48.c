/* func_02081f48: u32 setter at offset 0x2c.
 *
 *     str r1, [r0, #0x2c]
 *     bx  lr
 */

void func_02081f48(void *p, int value) {
    *(int *)((char *)p + 0x2c) = value;
}
