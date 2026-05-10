/* func_0207fd28: twin of func_0207fd08 with different first
 * callee.
 */

extern int func_0207e92c(void *p);
extern int func_0207fda4(void *p);

int func_0207fd28(void *p) {
    int r = func_0207e92c(p);
    if (r == 0) return r;
    return func_0207fda4(p);
}
