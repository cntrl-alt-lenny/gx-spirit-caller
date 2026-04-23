/* func_020536b4: u32 setter at offset 0x4.
 *
 *     str r1, [r0, #0x4]
 *     bx  lr
 */

void func_020536b4(void *p, int value) {
    *(int *)((char *)p + 0x4) = value;
}
