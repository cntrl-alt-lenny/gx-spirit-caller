struct Func02062468Target {
    char pad[12]; int f12; int f16; int f20; int f24; int f28; int f32; int f36;
};
struct S0206238c;
extern int func_0206238c(struct S0206238c *a, int b, int c, int *d);
/* This caller passes the parsed address and port in r2/r3; the C callee omits them. */
extern int func_02062468(int arg0, struct Func02062468Target **pp, unsigned address, unsigned short port);
extern int func_02064dfc(const char *, unsigned *, unsigned short *);
extern void func_020627a8(int a0);
/* The original loads only r0; the other definition parameters are unused. */
extern void func_02064790();
extern void func_02055324(void *p);
int func_02062600(int a, struct Func02062468Target **out, const char *name, int b, int c, int d, int *e, int wait) {
    struct Func02062468Target *p;
    unsigned word;
    unsigned short n;
    int result;
    int done;
    if (!func_02064dfc(name, &word, &n) || !word || !n) return 4;
    if (((((word >> 24) & 0xff) | ((word >> 8) & 0xff00) | ((word << 8) & 0xff0000) | ((word << 24) & 0xff000000)) & 0xe0000000) == 0xe0000000) return 4;
    result = func_02062468(a, &p, word, n);
    if (result) return result;
    p->f32 = d;
    result = func_0206238c((struct S0206238c *)p, b, c, e);
    if (result) {
        func_02064790(p);
        return result;
    }
    if (!wait) {
        if (out) *out = p;
        return 0;
    }
    p->f36++;
    do {
        func_020627a8(a);
        done = p->f12 >= 5;
        if (!done) func_02055324((void *)1);
    } while (!done);
    p->f36--;
    if (p->f12 == 5) *out = p;
    return p->f24;
}




