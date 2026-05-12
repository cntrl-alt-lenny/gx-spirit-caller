/* func_0201ef10: 2-case lookup. x==4 → 1, x==9 → 2, else 3.
 *
 *     cmp r0, #0x4
 *     beq .L_0201ef24
 *     cmp r0, #0x9
 *     beq .L_0201ef2c
 *     b   .L_0201ef34
 *  .L_0201ef24: mov r0, #0x1 ; bx lr
 *  .L_0201ef2c: mov r0, #0x2 ; bx lr
 *  .L_0201ef34: mov r0, #0x3 ; bx lr
 */

int func_0201ef10(int x) {
    switch (x) {
    case 4: return 1;
    case 9: return 2;
    }
    return 3;
}
