extern int func_020aaddc(const char *s);
extern void func_020aaec0(char *dst, char *src, int n);
extern int func_020ab054(unsigned char *s1, unsigned char *s2, int n);
extern char *Strchr(char *s, int c);

int func_02045b1c(char *key, char *out, char *text, int sep) {
    char *p;
    char *end;
    int len;
    if (!out) return -1;
    p = Strchr(text, sep);
    if (!p) return -1;
    while (1) {
        if (func_020ab054((unsigned char *)(p + 1), (unsigned char *)key, func_020aaddc(key)) == 0) {
            int offset = func_020aaddc(key);
            offset += (int)p;
            if (sep == ((char *)offset)[1]) break;
        }
        p = Strchr(p + 1, sep);
        if (!p) return -1;
        p = Strchr(p + 1, sep);
        if (!p) return -1;
    }
    p = Strchr(p + 1, sep);
    if (!p) return -1;
    end = Strchr(p + 1, sep);
    if (end) len = end - (p + 1);
    else len = func_020aaddc(p + 1);
    func_020aaec0(out, p + 1, len);
    out[len] = 0;
    return len;
}





