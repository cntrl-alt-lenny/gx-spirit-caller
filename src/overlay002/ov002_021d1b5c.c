/* func_ov002_021d1b5c: zero a slot in a global struct —
 * `data_ov002_022ce950[0x80c] = 0;`.
 *
 *     ldr r0, .L_021d1b6c
 *     mov r1, #0x0
 *     str r1, [r0, #0x80c]
 *     bx  lr
 *   .L_021d1b6c: .word data_ov002_022ce950
 */

extern char data_ov002_022ce950[];

void func_ov002_021d1b5c(void) {
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
