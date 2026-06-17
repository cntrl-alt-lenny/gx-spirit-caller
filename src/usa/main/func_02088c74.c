/* func_02088c74: zero two globals.
 *
 *     ldr r1, .L_02088d74    ; data_021a5124
 *     mov r2, #0x0
 *     ldr r0, .L_02088d78    ; data_021a516c
 *     str r2, [r1, #0x0]
 *     str r2, [r0, #0x0]
 *     bx  lr
 */

extern int data_021a5124;
extern int data_021a516c;

void func_02088c74(void) {
    data_021a5124 = 0;
    data_021a516c = 0;
}
