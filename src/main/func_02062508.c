/* func_02062508: u32 setter at offset 0x30.
 *
 *     str r1, [r0, #0x30]
 *     bx  lr
 */

void func_02062508(void *p, int value) {
    *(int *)((char *)p + 0x30) = value;
}
