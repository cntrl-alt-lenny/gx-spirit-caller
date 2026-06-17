/* func_020190c8: C-42 — helper1 cond + helper2 cmp-bool tail.
 *
 *   push {r3, lr}
 *   bl func_020190b8
 *   cmp r0, #0; beq L_end
 *   bl func_0201908c
 *   cmp r0, #5; movne r0, #1; popne
 *   L_end: mov r0, #0; pop
 */

extern int func_020190b8(void);
extern int func_0201908c(void);

int func_020190c8(void) {
    if (func_020190b8() != 0) {
        if (func_0201908c() != 5) return 1;
    }
    return 0;
}
