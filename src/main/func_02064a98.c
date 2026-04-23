/* func_02064a98: u32 setter at offset 0x20.
 *
 *     str r1, [r0, #0x20]
 *     bx  lr
 */

void func_02064a98(void *p, int value) {
    *(int *)((char *)p + 0x20) = value;
}
