int func_ov002_021aeb00(char *dst, int max, char **srcp)
{
    char *s = *srcp;
    int n = 0;

    if (*s != 0) {
        int lim = max - 1;
        do {
            char c = *s++;
            dst[n++] = c;
            if (n >= lim) {
                return 0;
            }
        } while (s[-1] != '\n' && *s != 0);
    }
    dst[n] = 0;
    *srcp = s;
    return n;
}
