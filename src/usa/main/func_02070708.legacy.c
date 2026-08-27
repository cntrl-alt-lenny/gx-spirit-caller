/* func_02070708: guard on func_02070764(a,b,e,f); if zero, return it. If
 * d==0, also return that same first result (not a fresh 0 -- the original
 * never re-materializes r0 on this path). Otherwise tail through a second
 * func_02070764(c,d,e,0) call. */

extern int func_02070764(int a, int b, int c, int d);

int func_02070708(int a, int b, int c, int d, int e, int f) {
    int result = func_02070764(a, b, e, f);
    if (result == 0) {
        return result;
    }
    if (d == 0) {
        return result;
    }
    return func_02070764(c, d, e, 0);
}
