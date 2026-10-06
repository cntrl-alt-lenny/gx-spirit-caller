typedef struct {
    int x0;
    int x4;
    int x8;
    int xc;
    int x10;
    int x14;
    char *buf;
    int cap;
    int x20;
    int x24;
    char _pad28[0x114];
    int x13c;
    int x140;
} Stream;

extern int func_020453e8(int a);
extern int func_0205ffc0(int *p, int b);
extern void func_020a73d4(void *ptr, int val, int size);
extern char data_02100e20[];

int func_0205fac4(void *pp, Stream **out, int id) {
    Stream *s = (Stream *)func_020453e8(0x144);

    if (s == 0) {
        func_0205ffc0((int *)pp, (int)data_02100e20);
        return 1;
    }
    func_020a73d4(s, 0, 0x144);
    s->x0 = id;
    s->x4 = -1;
    s->x8 = 0;
    s->x10 = 0;
    s->x14 = 0;
    s->xc = 0;
    s->x20 = 0;
    s->x24 = 0;
    s->cap = 0x1000;
    s->buf = (char *)func_020453e8(s->cap + 1);
    if (s->buf != 0) {
        s->x13c = 0;
        s->x140 = 0;
        *out = s;
        return 0;
    }
    func_0205ffc0((int *)pp, (int)data_02100e20);
    return 1;
}
