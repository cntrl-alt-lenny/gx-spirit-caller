extern unsigned char data_020c3654[];
extern long long func_020b3a7c(unsigned int a, unsigned int b);

int func_0206b1f8(const signed char *s, unsigned int divisor) {
    int c = *s;
    unsigned int hash = 0;
    while (c != 0) {
        hash = 0x9ccf9319 * hash + ((c < 0 || c >= 0x80) ? c : data_020c3654[c]);
        c = *++s;
    }
    return (int)(func_020b3a7c(hash, divisor) >> 32);
}
