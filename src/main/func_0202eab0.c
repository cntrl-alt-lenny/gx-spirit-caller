/* func_0202eab0: returns `func_0202e8ec() > 0`.
 *
 *     bl func_0202e8ec
 *     cmp r0, #0
 *     movgt r0, #1
 *     movle r0, #0
 */

extern int func_0202e8ec(void);
int func_0202eab0(void) {
    return func_0202e8ec() > 0;
}
