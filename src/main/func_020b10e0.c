typedef struct { unsigned char sign,pad; short exponent; unsigned char count,digits[32]; } Decimal;
extern void func_020b0f60(Decimal *, double);
extern void func_020b044c(Decimal *, int);
void func_020b10e0(Decimal *fmt, double value, Decimal *p) {
    int count = fmt->exponent;
    int i;
    func_020b0f60(p, value);
    if (p->digits[0] > 9) return;
    if (count > 32) count = 32;
    func_020b044c(p, count);
    while (p->count < count) {
        p->digits[p->count++] = 0;
    }
    p->exponent -= p->count - 1;
    for (i = 0; i < p->count; i++) {
        p->digits[i] += 0x30;
    }
}
