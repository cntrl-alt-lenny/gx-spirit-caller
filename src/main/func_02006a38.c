typedef struct { int a, b, c, d; unsigned int fl : 1; } G;
extern G data_02104f1c;
extern G data_02104f1c_alias;
extern struct { int v, w; } data_020c3e84[];
extern void FS_UnloadOverlay();
extern int func_020069f4(int);
extern void func_0209286c(void);
extern void func_020067f8(void);
void func_02006a38(void) {
    G *q = &data_02104f1c_alias;
    unsigned int f = data_02104f1c.fl;
    int c = data_02104f1c.c;
    int d = data_02104f1c.d;
    int a = data_02104f1c.a;
    int b = data_02104f1c.b;
    int r, t;
    if (f != 0) {
        FS_UnloadOverlay(0, c, f);
        if (d != -1) FS_UnloadOverlay(0, d);
        q->fl = 0;
    }
    r = (func_020069f4(a) == 0);
    if (b != -1) {
        t = (func_020069f4(b) == 0);
        r |= t;
    }
    func_0209286c();
    if (r != 0) return;
    q->fl = 1;
    q->c = data_020c3e84[a].v;
    if (b != -1) q->d = data_020c3e84[b].v; else q->d = -1;
    func_020067f8();
}
