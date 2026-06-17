/* func_02054dfc: twin of func_02054c84 with func_0206ec40 as
 * source. sp3.
 */

extern int func_0206ec40(void);
extern int func_02054e34(int x, int y);

int func_02054dfc(void) {
    return func_02054e34(func_0206ec40(), -1);
}
