/* func_0202c730: jump-table switch. Returns 1 for x in {5..8}, 0 for
 * x in {0..4} or x > 8. mwcc emits the `addls pc, pc, r0, lsl #2` table
 * dispatch when the case domain is dense and the body is tiny.
 *
 *     cmp r0, #0x8
 *     addls pc, pc, r0, lsl #0x2
 *     b .L_default
 *  .L_table: ; 9 branches
 *     b .L_default  ; 0
 *     b .L_default  ; 1
 *     b .L_default  ; 2
 *     b .L_default  ; 3
 *     b .L_default  ; 4
 *     b .L_one      ; 5
 *     b .L_one      ; 6
 *     b .L_one      ; 7
 *     b .L_one      ; 8
 *  .L_one:    mov r0,#1 ; bx lr
 *  .L_default:mov r0,#0 ; bx lr
 */

int func_0202c730(int x) {
    switch (x) {
    case 5:
    case 6:
    case 7:
    case 8:
        return 1;
    }
    return 0;
}
