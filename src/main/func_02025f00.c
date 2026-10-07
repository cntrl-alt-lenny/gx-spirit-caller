typedef struct {
    int f0;
    char name[0x20];
    int f24;
    int f28;
    int f2c;
    void *f30;
    void *f34;
    int f38;
} Req;

typedef struct {
    char pad0[0x74];
    char *w74;
    int w78;
    int w7c;
    int w80;
    char pad84[0xc];
    unsigned int w90;
    char pad94[0x100 - 0x94];
    char pad100[0x6a];
    unsigned short h16a;
} Obj;

extern void Fill32(int v, void *dst, int n);
extern void func_020aadf8(char *dst, char *src);
extern void func_02022b74(Req *r);
extern void func_02025fd0(void);

int func_02025f00(Obj *o) {
    Req r;
    int c;
    int v;
    if (o->w74 != 0) {
        Fill32(0, &r, 0x3c);
        r.f0 = 0;
        func_020aadf8(r.name, o->w74);
        v = o->w7c;
        c = 1;
        if (v >= 0) {
            if (!(o->w90 & 1)) {
                c = 0;
            }
        }
        if (c) {
            v = -1;
        }
        r.f24 = v;
        v = o->w80;
        c = 1;
        if (v >= 0) {
            if (!(o->w90 & 2)) {
                c = 0;
            }
        }
        if (c) {
            v = -1;
        }
        r.f28 = v;
        r.f30 = func_02025fd0;
        r.f34 = o;
        if (!(r.f24 < 0 && r.f28 < 0)) {
            func_02022b74(&r);
            o->h16a |= 0x400;
        }
    }
    return 1;
}
