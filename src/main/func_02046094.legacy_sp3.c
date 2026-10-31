typedef struct { int id; int field4; char *path; } Entry;
typedef struct { char pad0[0x24]; int state; char pad28[0x341]; volatile unsigned char mode; } Context;
extern Context *data_0219daec;
extern char data_020ff908[];
extern char data_020ff914[];
extern int func_02049270(int a, Entry *p, int c);
extern void func_02050140(int unused, int a1, char *path);
extern int func_020a7440(unsigned char *p0, unsigned char *p1, int count);
extern int func_020aaddc(const char *s);
extern char *func_020aaec0(char *dst, const char *src, unsigned int n);
extern char *Strchr(char *s, int c);
extern int func_020acca0(char *s, char **end, int base);
void func_02046094(int a, Entry *p, int c) {
    char buf[12] = {0};
    char *s = p->path;
    unsigned int n;
    if (func_02049270(a, p, c)) return;
    if (func_020a7440((unsigned char *)s, (unsigned char *)(data_020ff908 + 4), func_020aaddc(data_020ff908 + 4))) return;
    s += func_020aaddc(data_020ff908 + 4);
    n = Strchr(s, 'v') - s;
    func_020aaec0(buf, s, n);
    if (n > 10) return;
    if (func_020acca0(buf, 0, 10) != 3) return;
    s += n + 1;
    if (func_020a7440((unsigned char *)s, (unsigned char *)data_020ff914, func_020aaddc(data_020ff914))) return;
    if (data_0219daec->state == 5 || (data_0219daec->state == 6 && (data_0219daec->mode == 2 || data_0219daec->mode == 3))) {
        s += func_020aaddc(data_020ff914);
        func_02050140(a, p->id, s);
    }
}

