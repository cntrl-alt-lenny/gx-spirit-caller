typedef struct { unsigned char sign,pad; short exponent; unsigned char count,digits[32]; } Decimal;
int func_020b0390(Decimal *p, int n) {
    unsigned char value = p->digits[n];
    unsigned char *cur = &p->digits[n];
    unsigned char *end;
    if (value > 5) return 1;
    if (value < 5) return -1;
    end = p->digits + p->count;
    for (++cur; cur < end; ++cur) {
        if (*cur != 0) return 1;
    }
    return (p->digits[n - 1] & 1) ? 1 : -1;
}
