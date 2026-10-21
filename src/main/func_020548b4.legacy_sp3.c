extern int func_020a978c(char *dst, const char *format, ...);
extern const char data_020ffbcc[];

void func_020548b4(const unsigned char *src, char *dst) {
    unsigned int i = 0;
    unsigned int offset = 0;
    do {
        func_020a978c(dst + offset, data_020ffbcc, src[i]);
        i++;
        offset += 2;
    } while (i < 16);
}
