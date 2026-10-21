extern unsigned char data_020c3654[];

char *func_02055298(char *str) {
    char *start = str;
    int c;
    while ((c = *(signed char *)str) != 0) {
        *str++ = (c < 0 || c >= 0x80) ? c : data_020c3654[c];
    }
    return start;
}
