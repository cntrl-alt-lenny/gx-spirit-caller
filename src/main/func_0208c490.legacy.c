/* The existing void wrapper leaves the integer division result in r0;
 * this caller consumes that result. */
extern int func_0208bfa8(int unused0, int unused1);
extern short data_020c2f80[];

short func_0208c490(int x, int y)
{
    int numerator, denominator, base, add;
    if (x > 0) {
        if (y > 0) {
            if (y > x) { numerator = x; denominator = y; base = 0; add = 1; }
            else if (y < x) { numerator = y; denominator = x; base = 0x1922; add = 0; }
            else return 0xc91;
        } else if (y < 0) {
            y = -y;
            if (y < x) { numerator = y; denominator = x; base = 0x1922; add = 1; }
            else if (y > x) { numerator = x; denominator = y; base = 0x3244; add = 0; }
            else return 0x25b3;
        } else return 0x1922;
    } else if (x < 0) {
        x = -x;
        if (y < 0) {
            y = -y;
            if (y > x) { numerator = x; denominator = y; base = -0x3244; add = 1; }
            else if (y < x) { numerator = y; denominator = x; base = -0x1922; add = 0; }
            else return -0x25b3;
        } else if (y > 0) {
            if (y < x) { numerator = y; denominator = x; base = -0x1922; add = 1; }
            else if (y > x) { numerator = x; denominator = y; base = 0; add = 0; }
            else return -0xc91;
        } else return -0x1922;
    } else {
        if (y >= 0) return 0;
        else return 0x3244;
    }
    if (denominator == 0) return 0;
    if (add) return (short)(base + data_020c2f80[func_0208bfa8(numerator, denominator) >> 5]);
    else return (short)(base - data_020c2f80[func_0208bfa8(numerator, denominator) >> 5]);
}
