/* func_02054d4c: twin of func_02054cf8 with func_0206ee18 as
 * source. sp3.
 */

extern int func_0206ee18(void);
extern int func_02054ea8(int x, int y);

int func_02054d4c(void) {
    return func_02054ea8(func_0206ee18(), -1);
}
