/* func_0206a314: u32 setter at offset 0x4ac.
 *
 *     str r1, [r0, #0x4ac]
 *     bx  lr
 */

void func_0206a314(void *p, int value) {
    *(int *)((char *)p + 0x4ac) = value;
}
