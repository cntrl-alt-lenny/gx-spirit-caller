extern void func_02054a30(char *src, unsigned char *dst, int len);
extern signed char data_020bece4[];

void func_020548f4(char *src, signed char *dst, int len, int mode) {
    signed char *table;
    signed char *start = dst;
    int remaining = len;
    signed char *end;
    int value;
    switch (mode) {
    case 1: table = data_020bece4 + 0x6c; break;
    case 2: table = data_020bece4 + 0x70; break;
    default: table = data_020bece4 + 0x74; break;
    }
    while (remaining > 0) {
        func_02054a30(src, (unsigned char *)dst, len >= 3 ? 3 : len);
        remaining -= 3;
        dst += 4;
        src += 3;
    }
    end = dst;
    if (len % 3 == 1) end = dst - 2;
    else if (len % 3 == 2) end = dst - 1;
    *dst = 0;
    while (dst > start) {
        --dst;
        if (dst >= end) *dst = table[2];
        else {
            value = *dst;
            if (value <= 25) *dst = value + 0x41;
            else if (value <= 51) *dst = value + 0x47;
            else if (value <= 61) *dst = value - 4;
            else if (value == 62) *dst = table[0];
            else if (value == 63) *dst = table[1];
        }
    }
}


