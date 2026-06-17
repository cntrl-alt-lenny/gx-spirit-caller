/* func_02054e34: if-negative store with fall-through return.
 *
 *     cmp   r0, #0x0
 *     ldrlt r2, .L_02054ebc
 *     strlt r0, [r2, #0x0]
 *     movlt r0, r1
 *     bx    lr
 *  .L_02054ebc: .word data_0219e3f0
 *
 * `if (a < 0) { data_0219e3f0 = a; return b; } else return a;`
 * mwcc lifts the entire negative-branch into ARM's conditional
 * exec (`ldrlt`/`strlt`/`movlt`) — no actual branch, just predicated
 * loads/stores/movs.
 */

extern int data_0219e3f0;

int func_02054e34(int a, int b) {
    if (a < 0) {
        data_0219e3f0 = a;
        a = b;
    }
    return a;
}
