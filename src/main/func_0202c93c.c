/* func_0202c93c: returns the address of data_0219ad48 (a global
 * handle/pointer).
 *
 *     ldr r0, .L_0202c944
 *     bx  lr
 *   .L_0202c944: .word data_0219ad48
 */

extern char data_0219ad48[];

char *func_0202c93c(void) {
    return data_0219ad48;
}
