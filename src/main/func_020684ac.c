/* func_020684ac: u32 setter at offset 0x10.
 *
 *     str r1, [r0, #0x10]
 *     bx  lr
 */

void func_020684ac(void *p, int value) {
    *(int *)((char *)p + 0x10) = value;
}
