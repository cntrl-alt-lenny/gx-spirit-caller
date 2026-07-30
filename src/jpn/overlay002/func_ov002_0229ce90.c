extern char *func_0202b778(int idx);

void func_ov002_0229ce90(char *dst, int arg1) {
    char *src;
    dst[0] = 0;
    if (arg1 & 0xfffe0000) {
        src = (char *)arg1;
    } else {
        src = func_0202b778(arg1);
    }
    if (src == 0) return;
    if (*src != 0) {
        do {
            if (*src == 0x40 && src[1] >= 0x30 && src[1] <= 0x39) {
                src += 2;
            } else {
                *dst++ = *src++;
            }
        } while (*src != 0);
    }
    *dst = 0;
}
