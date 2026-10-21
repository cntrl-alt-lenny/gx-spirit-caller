extern int Strlen(char *s);

int func_020a6a94(char *dst, char *src, int size) {
    int i = 0;
    for (; i < size - 1; i++, src++) {
        dst[i] = *src;
        if (*src == 0) break;
    }
    if (i >= size - 1) {
        if (size != 0) dst[i] = 0;
    }
    return Strlen(src);
}

