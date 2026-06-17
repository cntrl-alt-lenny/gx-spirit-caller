/* func_0206be64: twin of func_0206bdb4 — different second
 * callee. Style A → .legacy.c.
 */

extern int func_0206bed8(int a, int b);
extern int func_0206be80(int a, int b);

int func_0206be64(int a, int b) {
    return func_0206be80(func_0206bed8(a, b), b);
}
