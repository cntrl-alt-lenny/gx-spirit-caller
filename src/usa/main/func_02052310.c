/* func_02052310: zero-out leaf — *(int *)data_0219e30c = 0.
 *
 *     ldr r0, .L_02052394
 *     mov r1, #0x0
 *     str r1, [r0, #0x0]
 *     bx  lr
 *  .L_02052394: .word data_0219e30c
 */

extern char data_0219e30c[];

void func_02052310(void) {
    *(int *)data_0219e30c = 0;
}
