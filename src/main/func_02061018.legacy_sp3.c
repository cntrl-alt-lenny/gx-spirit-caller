extern char data_021013f8[];
extern int func_020aaddc(const char *s);
extern int func_02061290(char *s);
extern int func_020a991c(void);
extern int func_020a6d48(int x);
extern long long func_020b3870(int a, int b);

char *func_02061018(char *dst, char *src) {
    int i;
    int prev;
    int len;
    int step;
    int cur;
    int valid;
    long long a;
    long long b;
    len = func_020aaddc(data_021013f8);
    valid = func_02061290(src);
    i = 0;
    step = 0;
    for (; i < 32; i++) {
        if (valid == 0 || i == 0 || i == 13) {
            dst[i] = func_020a991c() % 93 + 33;
        } else {
            if (i == 1 || i == 14) prev = src[i];
            else prev = src[i - 1];
            cur = (unsigned char)src[i];
            a = func_020b3870(i + cur, len);
            b = func_020b3870(prev * step, len);
            prev = data_021013f8[(int)(a >> 32)];
            cur = (prev + i * cur) % 32;
            prev = data_021013f8[(int)(b >> 32)];
            cur = (unsigned char)src[cur];
            cur ^= prev;
            dst[i] = func_020a6d48(cur) % 93 + 33;
        }
        step += 0x4647;
    }
    return dst;
}









