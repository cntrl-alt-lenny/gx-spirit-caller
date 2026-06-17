/* func_0207fc40: twin of func_0207fc20 with different first
 * callee.
 */

extern int func_0207e844(void *p);
extern int func_0207fcbc(void *p);

int func_0207fc40(void *p) {
    int r = func_0207e844(p);
    if (r == 0) return r;
    return func_0207fcbc(p);
}
