/* func_02088d5c: zero two globals.
 *
 *     ldr r1, .L_02088d74    ; data_021a5204
 *     mov r2, #0x0
 *     ldr r0, .L_02088d78    ; data_021a524c
 *     str r2, [r1, #0x0]
 *     str r2, [r0, #0x0]
 *     bx  lr
 */

extern int data_021a5204;
extern int data_021a524c;

void func_02088d5c(void) {
    data_021a5204 = 0;
    data_021a524c = 0;
}
