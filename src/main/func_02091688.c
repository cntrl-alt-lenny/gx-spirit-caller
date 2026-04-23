/* func_02091688: u32 setter at offset 0xb4.
 *
 *     str r1, [r0, #0xb4]
 *     bx  lr
 */

void func_02091688(void *p, int value) {
    *(int *)((char *)p + 0xb4) = value;
}
