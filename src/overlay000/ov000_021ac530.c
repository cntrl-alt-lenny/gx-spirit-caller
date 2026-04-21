/* func_ov000_021ac530: 32-bit setter at offset 0x10 of struct r0.
 *
 *     str r1, [r0, #0x10]
 *     bx  lr
 */

void func_ov000_021ac530(void *p, int v) {
    *(int *)((char *)p + 0x10) = v;
}
