typedef struct {
    int f0;
    char name[0x20];
    int f24;
    int f28;
    void *f2c;
    void *f30;
    void *f34;
    int f38;
} Req;

typedef struct {
    char pad0[0xc];
    int w0c;
    short h10;
} Sub;

typedef struct {
    char pad0[0x68];
    char *w68;
    char pad6c[0x90 - 0x6c];
    Sub sub;
    char pad_a[0x19a - 0x90 - sizeof(Sub)];
    unsigned short h19a;
} Obj;

extern void Fill32(int v, void *dst, int n);
extern void func_020aadf8(char *dst, char *src);
extern void func_02022b74(Req *r);
extern void func_020296b8(void);

int func_02029624(Obj *o) {
    Req r;
    Sub *s = &o->sub;
    if (o->w68 != 0) {
        Fill32(0, &r, 0x3c);
        r.f0 = 2;
        func_020aadf8(r.name, o->w68);
        r.f2c = s;
        r.f24 = s->w0c;
        r.f28 = s->h10;
        r.f30 = func_020296b8;
        r.f34 = o;
        if (!(r.f24 < 0 && r.f28 < 0)) {
            func_02022b74(&r);
            o->h19a |= 0x40;
        }
    }
    return 1;
}
