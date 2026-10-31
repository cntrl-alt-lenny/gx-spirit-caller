extern unsigned short *data_ov006_021cbbc8;

int func_ov006_021b9e08(int unused, unsigned char *out, int value) {
    int digits[16];
    int n = value >= 0 ? value : -value;
    int count = 0;
    int sign = (value < 0);
    int i;
    do {
        digits[count++] = n % 10;
        n /= 10;
    } while (n > 0 && count < 16);
    if (value < 0)
        *(unsigned short *)out = data_ov006_021cbbc8[10];
    i = 0;
    if (count > 0) {
        unsigned short *table = data_ov006_021cbbc8;
        do {
            int digit = digits[count - 1 - i];
            *(unsigned short *)(out + (i + sign) * 2) = table[digit];
            i++;
        } while (i < count);
    }
    out[(count + sign) * 2] = 0;
    return 1;
}
