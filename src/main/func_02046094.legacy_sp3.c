typedef struct { int id; int unused; char *text; } Arg;
typedef struct { char pad[0x24]; int state; char pad2[0x341]; volatile unsigned char mode; } Context;
extern Context *data_0219daec;
extern char data_020ff908[];
extern char data_020ff914[];
/* The original forwards incoming r2 unchanged; the helper ignores it. */
extern int func_02049270(int a, Arg *b, void *user);
extern void func_02050140(int unused, int a1, char *path);
extern int func_020a7440(unsigned char *p0, unsigned char *p1, int count);
extern int func_020aaddc(const char *s);
extern void func_020aaec0(char *out, char *s, int n);
extern char *Strchr(char *s, int c);
extern int func_020acca0(char *s, int end, int base);
void func_02046094(int a, Arg *b, void *user) {
    char buf[12] = "";
    char *p = b->text;
    unsigned int n;
    if (func_02049270(a, b, user)) return;
    if (func_020a7440((unsigned char *)p, (unsigned char *)(data_020ff908 + 4), func_020aaddc(data_020ff908 + 4))) return;
    p += func_020aaddc(data_020ff908 + 4);
    n = Strchr(p, 'v') - p;
    func_020aaec0(buf, p, n);
    if (n > 10) return;
    if (func_020acca0(buf, 0, 10) != 3) return;
    p += n + 1;
    if (func_020a7440((unsigned char *)p, (unsigned char *)data_020ff914, func_020aaddc(data_020ff914))) return;
    if (data_0219daec->state != 5) {
        if (data_0219daec->state != 6) return;
        if (data_0219daec->mode != 2 && data_0219daec->mode != 3) return;
    }
    p += func_020aaddc(data_020ff914);
    func_02050140(a, b->id, p);
}


