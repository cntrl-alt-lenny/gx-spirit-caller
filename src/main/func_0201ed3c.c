/* func_0201ed3c: family 2 — helper1 + null-check + helper2 + Task_InvokeLocked.
 *
 *     push {r3, r4, r5, lr}
 *     mov r5, r0; mov r0, r1
 *     bl func_0201ed28(arg1)
 *     movs r4, r0; beq L_zero
 *     mov r1, r5
 *     bl func_0207e664(h, arg0)
 *     cmp r0, #0; mov r0, r4; popne   ; return h if h2 != 0
 *     bl Task_InvokeLocked(h)
 *     L_zero: mov r0, #0; pop
 *
 * Sibling family: 4 picks (0201ed3c, 0201ed74, 0201edac, 0201ede4)
 * with identical shape, different helper2.
 */
extern int func_0201ed28(int arg1);
extern int func_0207e664(int h, int arg0);
extern void Task_InvokeLocked(int h);

int func_0201ed3c(int arg0, int arg1) {
    int h = func_0201ed28(arg1);
    if (h != 0) {
        if (func_0207e664(h, arg0) != 0) return h;
        Task_InvokeLocked(h);
    }
    return 0;
}
