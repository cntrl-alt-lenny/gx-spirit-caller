extern signed char data_020bece4[];
extern void func_02054a30(char *src, unsigned char *dst, int len);

void func_020548f4(char *src, signed char *dst, int len, int mode) {
    signed char *alphabet;
    signed char *start = dst;
    int remaining = len;
    signed char *end;
    switch (mode) {
    case 1: alphabet = data_020bece4 + 0x6c; break;
    case 2: alphabet = data_020bece4 + 0x70; break;
    default: alphabet = data_020bece4 + 0x74; break;
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
        if (dst >= end) *dst = alphabet[2];
        else if (*dst <= 25) *dst += 65;
        else if (*dst <= 51) *dst += 71;
        else if (*dst <= 61) *dst -= 4;
        else if (*dst == 62) *dst = alphabet[0];
        else if (*dst == 63) *dst = alphabet[1];
    }
}


