/* func_02054de0: twin of func_02054c84 with func_0206ec4c as
 * source. sp3.
 */

extern int func_0206ec4c(void);
extern int func_02054e34(int x, int y);

int func_02054de0(void) {
    return func_02054e34(func_0206ec4c(), -1);
}
