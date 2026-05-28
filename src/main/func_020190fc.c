/* func_020190fc: C-42 — helper1 cond + helper2 cmp-bool tail.
 *
 *   push {r3, lr}
 *   bl func_020190ec
 *   cmp r0, #0; beq L_end
 *   bl func_020190c0
 *   cmp r0, #5; movne r0, #1; popne
 *   L_end: mov r0, #0; pop
 */

extern int func_020190ec(void);
extern int func_020190c0(void);

int func_020190fc(void) {
    if (func_020190ec() != 0) {
        if (func_020190c0() != 5) return 1;
    }
    return 0;
}
