/* func_02068114: u32 setter at offset 0x28.
 *
 *     str r1, [r0, #0x28]
 *     bx  lr
 */

void func_02068114(void *p, int value) {
    *(int *)((char *)p + 0x28) = value;
}
