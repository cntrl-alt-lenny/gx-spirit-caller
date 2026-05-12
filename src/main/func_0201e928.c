/* func_0201e928: 2-case lookup. x==1 → 4, x==2 → 9, else 0. mwcc emits
 * branchy form with 3 separate return blocks (no predication).
 *
 *     cmp r0, #0x1
 *     beq .L_0201e93c
 *     cmp r0, #0x2
 *     beq .L_0201e944
 *     b   .L_0201e94c
 *  .L_0201e93c: mov r0, #0x4 ; bx lr
 *  .L_0201e944: mov r0, #0x9 ; bx lr
 *  .L_0201e94c: mov r0, #0x0 ; bx lr
 */

int func_0201e928(int x) {
    switch (x) {
    case 1: return 4;
    case 2: return 9;
    }
    return 0;
}
