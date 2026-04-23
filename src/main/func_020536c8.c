/* func_020536c8: u32 setter at offset 0x8. Sibling of func_020536b4.
 *
 *     str r1, [r0, #0x8]
 *     bx  lr
 */

void func_020536c8(void *p, int value) {
    *(int *)((char *)p + 0x8) = value;
}
