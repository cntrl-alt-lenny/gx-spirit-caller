/* The caller consumes r0 from this fixed-point division helper. */
extern int func_0208bfa8(int, int);
void func_ov000_021aaee4(int r, int g, int b, int *h, volatile int *s, int *v)
{
    int max, min, delta;
    max = r >= g ? r : g;
    if (b > max) max = b;
    min = r <= g ? r : g;
    if (b < min) min = b;
    *v = max / 255;
    delta = max - min;
    *s = max == 0 ? 0 : func_0208bfa8(delta, max);
    if (*s == 0) {
        *s = 0;
        *h = 0;
    }
    if (r == max) {
        if (delta == 0) *h = 0; else *h = func_0208bfa8(g-b, delta);
    } else if (g == max) {
        if (delta == 0) *h = 0x2000; else *h = func_0208bfa8(b-r, delta) + 0x2000;
    } else if (b == max) {
        if (delta == 0) *h = 0x4000; else *h = func_0208bfa8(r-g, delta) + 0x4000;
    }
    *h *= 60;
    if (*h < 0) *h += 0x168000;
}

