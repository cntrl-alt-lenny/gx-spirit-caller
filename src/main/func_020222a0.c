extern int func_020224c0(char *base, int mode, int val);
extern int func_02022260(void *p, int idx, unsigned int v);
extern int func_02022234(unsigned int idx, unsigned int v);
extern int Rand_Next(void);
/* Division helper returns quotient in r0 and remainder in r1. */
extern long long func_020b3870(int numerator, int denominator);
extern const short data_020bef80[];

int func_020222a0(char *base, int op, int idx, int rhs) {
    int value = rhs;
    rhs = func_020224c0(base, 1, idx);
    switch (op) {
    case 0: value = (unsigned int)rhs + value; break;
    case 1: value = rhs - value; break;
    case 2: value = (unsigned int)rhs * value; break;
    case 3: value = (int)func_020b3870(rhs, value); break;
    case 4: value = (int)(func_020b3870(rhs, value) >> 32); break;
    case 5: value = (unsigned int)rhs & value; break;
    case 6: value = (unsigned int)rhs | value; break;
    case 7: value = (unsigned int)rhs ^ value; break;
    case 8: value = (int)(func_020b3870(Rand_Next(), value) >> 32); break;
    case 9: if (value < 0) value = -value; break;
    case 10: {
        int digits = 1;
        if (value < 0) value = -value;
        while (value >= 10) {
            value /= 10;
            digits++;
        }
        value = digits;
        break;
    }
    case 11: value = data_020bef80[((unsigned short)(value << 8) >> 4) * 2 + 1] >> 4; break;
    case 12: value = data_020bef80[((unsigned short)(value << 8) >> 4) * 2] >> 4; break;
    default: return 0;
    }
    if (idx >= 0x20) func_02022260(base, idx - 0x20, value);
    else func_02022234(idx, value);
    return 1;
}






