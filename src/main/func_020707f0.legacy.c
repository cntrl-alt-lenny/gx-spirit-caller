/* func_020707f0: guard on func_0207084c(a,b,e,f); if zero, return it. If
 * d==0, also return that same first result (not a fresh 0 -- the original
 * never re-materializes r0 on this path). Otherwise tail through a second
 * func_0207084c(c,d,e,0) call. */

extern int func_0207084c(int a, int b, int c, int d);

int func_020707f0(int a, int b, int c, int d, int e, int f) {
    int result = func_0207084c(a, b, e, f);
    if (result == 0) {
        return result;
    }
    if (d == 0) {
        return result;
    }
    return func_0207084c(c, d, e, 0);
}
