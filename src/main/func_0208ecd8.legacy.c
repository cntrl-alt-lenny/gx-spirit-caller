typedef long long s64;
typedef unsigned long long u64;
extern void func_0208be9c(unsigned int x);
/* Assembly implementation returns the 64-bit division result in r0/r1. */
extern s64 func_0208bf14(void);
extern s64 func_020b3658(s64 numerator, s64 denominator);
void func_0208ecd8(int top, int bottom, int nearz, int farz, int left, int right, int scale, int load, int *out)
{
    s64 z, y, x;
    int a, b, c;
    int *port;
    func_0208be9c(farz - nearz);
    if (load) {
        *(int *)0x04000440 = 0;
        port = (int *)0x04000458;
    }
    if (out) {
        out[1] = 0; out[2] = 0; out[3] = 0; out[4] = 0;
        out[6] = 0; out[7] = 0; out[8] = 0; out[9] = 0;
        out[11] = 0; out[15] = scale;
    }
    z = func_0208bf14();
    *(u64 *)0x04000290 = 0x100000000000ULL;
    *(u64 *)0x04000298 = (unsigned int)(top - bottom);
    if (scale != 0x1000) z = func_020b3658(z * scale, 0x1000);
    a = ((z << 13) + 0x80000000LL) >> 32;
    if (load) { *port = a; *port = 0; *port = 0; *port = 0; *port = 0; }
    if (out) out[0] = a;
    y = func_0208bf14();
    *(u64 *)0x04000290 = 0x100000000000ULL;
    *(u64 *)0x04000298 = (unsigned int)(left - right);
    if (scale != 0x1000) y = func_020b3658(y * scale, 0x1000);
    b = ((y << 13) + 0x80000000LL) >> 32;
    if (load) { *port = b; *port = 0; *port = 0; *port = 0; *port = 0; }
    if (out) out[5] = b;
    x = func_0208bf14();
    if (scale != 0x1000) x = func_020b3658(x * scale, 0x1000);
    c = ((x << 13) + 0x80000000LL) >> 32;
    if (load) { *port = c; *port = 0; }
    if (out) out[10] = c;
    a = (z * -(farz + nearz) + 0x80000000LL) >> 32;
    b = (y * -(top + bottom) + 0x80000000LL) >> 32;
    c = (x * (right + left) + 0x80000000LL) >> 32;
    if (load) { *port = a; *port = b; *port = c; *port = scale; }
    if (out) { out[12] = a; out[13] = b; out[14] = c; }
}
