/* func_0202ea5c: returns `func_0202e898() > 0`.
 *
 *     bl func_0202e898
 *     cmp r0, #0
 *     movgt r0, #1
 *     movle r0, #0
 */

extern int func_0202e898(void);
int func_0202ea5c(void) {
    return func_0202e898() > 0;
}
