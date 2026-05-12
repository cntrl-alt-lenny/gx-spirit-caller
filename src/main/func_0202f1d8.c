/* func_0202f1d8: jump-table switch on (x - 0x189e). Returns 1 for the
 * 4 "true" cases (0x189e, 0x189f, 0x18a0, 0x18a4) and 0 otherwise.
 *
 *     sub r0, r0, #0x9e
 *     sub r0, r0, #0x1800
 *     cmp r0, #0x6
 *     addls pc, pc, r0, lsl #0x2
 *     b .L_zero
 *  .L_table:
 *     b .L_one     ; case 0  (orig 0x189e)
 *     b .L_one     ; case 1  (0x189f)
 *     b .L_one     ; case 2  (0x18a0)
 *     b .L_zero    ; case 3  (0x18a1)
 *     b .L_zero    ; case 4  (0x18a2)
 *     b .L_zero    ; case 5  (0x18a3)
 *     b .L_one     ; case 6  (0x18a4)
 *  .L_one:  mov r0,#1 ; bx lr
 *  .L_zero: mov r0,#0 ; bx lr
 */

int func_0202f1d8(int x) {
    switch (x) {
    case 0x189e:
    case 0x189f:
    case 0x18a0:
    case 0x18a4:
        return 1;
    }
    return 0;
}
