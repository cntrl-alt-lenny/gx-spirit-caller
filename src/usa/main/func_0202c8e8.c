/* func_0202c8e8: returns the address of data_0219ac68 (a global
 * handle/pointer).
 *
 *     ldr r0, .L_0202c944
 *     bx  lr
 *   .L_0202c944: .word data_0219ac68
 */

extern char data_0219ac68[];

char *func_0202c8e8(void) {
    return data_0219ac68;
}
