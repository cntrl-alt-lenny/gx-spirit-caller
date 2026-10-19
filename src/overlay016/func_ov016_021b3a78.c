extern unsigned long long func_020b3814(unsigned long long value, unsigned long long divisor);
extern unsigned long long func_020b3808(unsigned long long value, unsigned long long divisor);
void func_ov016_021b3a78(unsigned short *out, unsigned int lo, unsigned int hi) {
    unsigned long long value = ((unsigned long long)hi << 32) | lo;
    unsigned short sum = 0;
    unsigned short power = 1;
    int i;
    for (i = 0; i < 12; i++) {
        unsigned long long digit = func_020b3814(value, 10);
        sum += digit * power;
        value = func_020b3808(value, 10);
        power *= 10;
        if (i % 4 == 3) {
            *out++ = sum;
            sum = 0;
            power = 1;
        }
    }
}




