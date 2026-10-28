typedef long long s64;
typedef unsigned long long u64;
/* These wrappers leave the hardware division result in r0 and r0/r1. */
extern int func_0208bfa8(int unused0, int unused1);
extern int func_0208bed8(void);
extern s64 func_0208bf14(void);
extern s64 func_020b3658(s64 numerator, s64 denominator);
void func_0208efd4(int a, int b, int aspect, int nearz, int farz, int scale, int load, int *out)
{
    int cot, x, y, z;
    s64 q;
    int *port;
    int nf;
    cot = func_0208bfa8(b, a);
    if (scale != 0x1000) cot = (cot * scale) / 0x1000;
    *(u64 *)0x04000290 = (u64)(unsigned int)cot << 32;
    *(u64 *)0x04000298 = (unsigned int)aspect;
    if (load) {
        *(int *)0x04000440 = 0;
        port = (int *)0x04000458;
    }
    if (out) {
        out[1]=0; out[2]=0; out[3]=0; out[4]=0;
        out[6]=0; out[7]=0; out[8]=0; out[9]=0;
        out[11]=-scale; out[12]=0; out[13]=0; out[15]=0;
    }
    x = func_0208bed8();
    *(u64 *)0x04000290 = 0x100000000000ULL;
    *(u64 *)0x04000298 = (unsigned int)(nearz - farz);
    if (load) {
        *port=x; *port=0; *port=0; *port=0; *port=0;
        *port=cot; *port=0; *port=0; *port=0; *port=0;
    }
    if (out) {out[0]=x; out[5]=cot;}
    q = func_0208bf14();
    if (scale != 0x1000) q = func_020b3658(q * scale, 0x1000);
    nf = (int)(((s64)(nearz << 1) * farz + 0x800) >> 12);
    y = (q * (farz + nearz) + 0x80000000LL) >> 32;
    z = (q * nf + 0x80000000LL) >> 32;
    if (load) {
        *port=y; *port=-scale; *port=0; *port=0; *port=z; *port=0;
    }
    if (out) {out[10]=y; out[14]=z;}
}




