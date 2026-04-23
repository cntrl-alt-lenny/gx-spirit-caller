/* func_02068964: u32 setter at offset 0x20 (counterpart of func_0206895c
 * getter — same struct field).
 *
 *     str r1, [r0, #0x20]
 *     bx  lr
 */

void func_02068964(void *p, int value) {
    *(int *)((char *)p + 0x20) = value;
}
