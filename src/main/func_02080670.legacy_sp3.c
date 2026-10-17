typedef unsigned short u16;

extern void func_0208060c(u16 *p, int w, int h, int n, int idx, int pal);

void func_02080670(u16 *base, int w, int h, int x0, int y0, int n, int idx, int pal)
{
    int xEnd;
    int yEnd;
    int x;
    int y;
    int row;
    int col;
    u16 hi;
    u16 *rp;
    if (n <= 0x20) {
        func_0208060c(base + (n * y0 + x0), w, h, n, idx, pal);
        return;
    }
    yEnd = y0 + h;
    xEnd = x0 + w;
    hi = pal << 12;
    for (y = y0; y < yEnd; y++) {
        if (y < 0x20) {
            row = y;
        } else {
            row = y + 0x20;
        }
        rp = base + row * 32;
        for (x = x0; x < xEnd; x++) {
            if (x < 0x20) {
                col = x;
            } else {
                col = x + 0x3e0;
            }
            rp[col] = hi | idx;
            idx++;
        }
    }
}