/* func_0206bed8: twin of func_0206be28 — different second
 * callee. Style A → .legacy.c.
 */

extern int func_0206bf4c(int a, int b);
extern int func_0206bef4(int a, int b);

int func_0206bed8(int a, int b) {
    return func_0206bef4(func_0206bf4c(a, b), b);
}
