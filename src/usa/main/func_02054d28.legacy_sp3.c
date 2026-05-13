/* func_02054d28: twin of func_02054c84 with func_0206ea10 as
 * source. sp3.
 */

extern int func_0206ea10(void);
extern int func_02054e34(int x, int y);

int func_02054d28(void) {
    return func_02054e34(func_0206ea10(), -1);
}
