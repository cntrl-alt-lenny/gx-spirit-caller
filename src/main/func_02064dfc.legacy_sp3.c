extern char *Strchr(char *s, int c);
extern void func_020a6d54(void *a, void *b, int c, int d);
extern void func_020a7368(void *dst, void *src, int n);
extern int func_020ace00();
extern int func_02054c0c(char *s);
extern int *func_0206ebe8(char *s);
extern char data_02101554[], data_02101578[];
extern unsigned short data_020c3754[];

int func_02064dfc(char *s, int *out1, unsigned short *out2) {
    char buf[256];
    int a;
    unsigned short b;
    char *p;
    char *q;
    int len;
    int n;
    int c;
    if (s == 0 || *s == 0) {
        a = 0;
        b = 0;
    } else {
        p = Strchr(s, ':');
        if (p == 0) {
            b = 0;
        } else {
            if (p == s) {
                s = 0;
                a = 0;
            } else {
                len = p - s;
                if (len >= 0x100) {
                    func_020a6d54(data_02101554 + 4, data_02101578, 0, 0x81);
                }
                func_020a7368(buf, s, len);
                s = buf;
                buf[len] = 0;
            }
            q = p + 1;
            for (; (c = *q) != 0; q++) {
                if (c < 0 || c >= 0x80) c = 0;
                else c = data_020c3754[c] & 8;
                if (c == 0) return 0;
            }
            n = func_020ace00(p + 1);
            if (n < 0 || n > 0xffff) return 0;
            b = n;
        }
        if (s != 0) {
            a = func_02054c0c(s);
            if (a == -1) {
                int *r = func_0206ebe8(s);
                if (r == 0) return 0;
                a = **(int **)(r[3]);
            }
        }
    }
    if (out1 != 0) *out1 = a;
    if (out2 != 0) *out2 = b;
    return 1;
}
