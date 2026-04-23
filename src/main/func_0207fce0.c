/* func_0207fce0: u32 setter at offset 0x10.
 *
 *     str r1, [r0, #0x10]
 *     bx  lr
 */

void func_0207fce0(void *p, int value) {
    *(int *)((char *)p + 0x10) = value;
}
