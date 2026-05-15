/* func_02043a1c: return the address of data_0219d99c.
 *
 *     ldr r0, .L_02043a74
 *     bx  lr
 *   .L_02043a74: .word data_0219d99c
 */

extern char data_0219d99c[];

char *func_02043a1c(void) {
    return data_0219d99c;
}
