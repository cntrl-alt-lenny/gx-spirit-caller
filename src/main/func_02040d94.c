extern char *func_02040de8(void *self, const char *key);
extern int func_020aaddc(const char *s);
extern int func_02043728(const char *s, int len, char *buf, unsigned size);

int func_02040d94(void *self, const char *key, char *buf, unsigned size) {
    char *s = func_02040de8(self, key);
    int n;
    if (s == 0) {
        return 0;
    }
    n = func_02043728(s, func_020aaddc(s), buf, size);
    if (n == -1 || (unsigned)n >= size) {
        return n;
    }
    buf[n] = 0;
    return n;
}
