typedef struct {
    char s[0x100];
} key_02060cbc_t;

extern key_02060cbc_t data_020bed6c;
extern int data_0219e520;
extern char data_021013f4[];
extern char data_0219e728[2][0x100];
extern void func_020aaf10(char *dst, char *src);
extern char *func_020ab0c4(char *haystack, char *needle);
extern int func_020aaddc(char *s);

char *func_02060cbc(char *s, char *name) {
    key_02060cbc_t key = data_020bed6c;
    char *p;
    char *d;
    char *ret;

    data_0219e520 ^= 1;
    func_020aaf10(key.s, name);
    func_020aaf10(key.s, data_021013f4);
    p = func_020ab0c4(s, key.s);
    if (p == 0) {
        return 0;
    }
    p += func_020aaddc(key.s);
    ret = data_0219e728[data_0219e520];
    d = ret;
    while (*p != 0 && *p != '\\') {
        *d++ = *p++;
    }
    *d = 0;
    return ret;
}
