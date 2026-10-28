typedef unsigned short u16;
extern int func_0208bfa8(int, int);
extern const short data_020c3084[130];

u16 func_0208c66c(int x, int y)
{
    int base, add, n;
    if (x > 0) {
        if (y > 0) {
            if (y > x) { n = x; base = 0; add = 1; }
            else if (y < x) { n = y; y = x; base = 0x4000; add = 0; }
            else return 0x2000;
        } else if (y < 0) {
            y = -y;
            if (y < x) { n = y; y = x; base = 0x4000; add = 1; }
            else if (y > x) { n = x; base = 0x8000; add = 0; }
            else return 0x6000;
        } else return 0x4000;
    } else if (x < 0) {
        x = -x;
        if (y < 0) {
            y = -y;
            if (y > x) { base = -0x8000; n = x; add = 1; }
            else if (y < x) { n = y; y = x; base = -0x4000; add = 0; }
            else return 0xa000;
        } else if (y > 0) {
            if (y < x) { n = y; y = x; base = -0x4000; add = 1; }
            else if (y > x) { base = 0; n = x; add = 0; }
            else return 0xe000;
        } else return 0xc000;
    } else {
        if (y >= 0) return 0;
        return 0x8000;
    }
    if (y == 0) return 0;
    if (add) return base + data_020c3084[func_0208bfa8(n, y) >> 5];
    return base - data_020c3084[func_0208bfa8(n, y) >> 5];
}
