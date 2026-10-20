extern short data_020b4d60[][8];
extern unsigned short data_020b4b1c[];
extern int func_020a991c(void);
/* Signed division returns quotient in r0 and remainder in r1. */
extern long long func_020b3870(int numerator, int denominator);
int func_020117e4(int a, int b, int c, int d, int e) {
    int value = data_020b4d60[a][b];
    unsigned short index;
    unsigned short *p;
    int i;
    unsigned short count;
    if (value >= 0) return value;
    index = -value;
    p = data_020b4b1c;
    for (i = 0; i < index; i++) {
        value = *p;
        p = p + 1;
        p = p + value;
    }
    count = *p;
    if (e == 1) return p[1];
    switch (index) {
    default:
        return (p + (int)(func_020b3870(func_020a991c(), count) >> 32))[1];
    case 8:
    case 9:
        if (c == 4 && d == 7) return p[2];
        return p[1];
    case 10:
        if (c == 19 && d == 3) return p[2];
        return p[1];
    case 13:
        if (c == 22 && d == 1) return p[2];
        return p[1];
    case 21:
        if (c == 33) {
            if (d == 2) return p[2];
            if (d == 3) return p[1];
            if (d == 4) return p[3];
            return (p + (int)(func_020b3870(func_020a991c(), count) >> 32))[1];
        }
        return (p + (int)(func_020b3870(func_020a991c(), count) >> 32))[1];
    case 24:
        if (c == 23 && d >= 5) return p[2];
        return p[1];
    case 25:
        if (c > 32 || (c == 32 && d >= 3)) return p[2];
        return p[1];
    case 26:
        if (c > 8 || (c == 8 && d >= 3)) return p[2];
        return p[1];
    case 27:
        if (c >= 11) return p[2];
        return p[1];
    }
}



