/* func_02043a6c: return the address of data_0219da7c.
 *
 *     ldr r0, .L_02043a74
 *     bx  lr
 *   .L_02043a74: .word data_0219da7c
 */

extern char data_0219da7c[];

char *func_02043a6c(void) {
    return data_0219da7c;
}
