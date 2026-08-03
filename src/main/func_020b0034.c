typedef union {
    double d;
    struct {
        unsigned int lo, hi;
    } w;
} DblBits;

double func_020b0034(DblBits a, DblBits b)
{
    a.w.hi = (a.w.hi & 0x7fffffff) | (b.w.hi & 0x80000000);
    return a.d;
}
