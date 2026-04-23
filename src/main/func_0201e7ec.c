/* func_0201e7ec: u32 setter at offset 0x8 (counterpart of func_0201e7e4).
 *
 *     str r1, [r0, #0x8]
 *     bx  lr
 */

void func_0201e7ec(void *p, int value) {
    *(int *)((char *)p + 0x8) = value;
}
