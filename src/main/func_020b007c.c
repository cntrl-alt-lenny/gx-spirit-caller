extern double func_020b1e88(double, double);
double func_020b007c(double x, int *eptr)
{
    int hx, ix, lx;
    hx = ((int *)&x)[1];
    ix = hx & 0x7fffffff;
    lx = ((int *)&x)[0];
    *eptr = 0;
    if (ix >= 0x7ff00000 || ((ix | lx) == 0))
        return x;
    if (ix < 0x100000) {
        x = func_020b1e88(x, 18014398509481984.0);
        *eptr = -54;
        hx = ((int *)&x)[1];
    ix = hx & 0x7fffffff;
    }
    *eptr += (ix >> 20) - 1022;
    ((int *)&x)[1] = (hx & 0x800fffff) | 0x3fe00000;
    return x;
}
