/* func_02054e70: twin of func_02054cf8 with func_0206ecb4 as
 * source. sp3.
 */

extern int func_0206ecb4(void);
extern int func_02054ea8(int x, int y);

int func_02054e70(void) {
    return func_02054ea8(func_0206ecb4(), -1);
}
