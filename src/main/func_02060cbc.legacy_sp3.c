typedef struct {
    signed char s[0x100];
} key_02060cbc_t;

extern key_02060cbc_t data_020bed6c;
extern int data_0219e520;
extern signed char data_021013f4[];
extern signed char data_0219e728[2][0x100];
extern void func_020aaf10(signed char *dst, signed char *src);
extern char *func_020ab0c4(char *haystack, char *needle);
extern int func_020aaddc(char *s);

signed char *func_02060cbc(char *s, signed char *name) {
    key_02060cbc_t key = data_020bed6c;
    signed char *p;
    signed char *d;
    signed char *ret;

    data_0219e520 ^= 1;
    func_020aaf10(key.s, name);
    func_020aaf10(key.s, data_021013f4);
    p = (signed char *)func_020ab0c4(s, (char *)key.s);
    if (p == 0) {
        return 0;
    }
    p += func_020aaddc((char *)key.s);
    ret = data_0219e728[data_0219e520];
    d = ret;
    while (*p != 0 && *p != '\\') {
        *d++ = *p++;
    }
    *d = 0;
    return ret;
}
