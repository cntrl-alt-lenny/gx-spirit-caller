/* func_02054e54: twin of func_02054cf8 with func_0206ecc0 as
 * source. sp3.
 */

extern int func_0206ecc0(void);
extern int func_02054ea8(int x, int y);

int func_02054e54(void) {
    return func_02054ea8(func_0206ecc0(), -1);
}
