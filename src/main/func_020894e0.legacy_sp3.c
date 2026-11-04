typedef struct Obj {
    char pad0[0x10];
    int off10;
    int len14;
    int off18;
    int len1c;
    int off20;
    int len24;
    char pad28[0xc];
    char strm[0x50];
    void *p84;
    void *p88;
    void *p8c;
} Obj;

extern int func_02097ea4(void *strm, int off, int sel);
extern int func_02097f10(void *strm, void *buf, int n);
extern void *func_020897fc(void *a, int n, void *cb, void *obj, int z);
extern void func_02088fe4(void);
extern void func_02088ff0(void);
extern void func_02088ffc(void);

int func_020894e0(Obj *o, void *ctx, int flag)
{
    int n;
    if (!func_02097ea4(o->strm, 0, 0)) return 0;
    if (func_02097f10(o->strm, o, 0x30) != 0x30) return 0;
    if (ctx) {
        o->p8c = func_020897fc(ctx, o->len1c, func_02088ffc, o, 0);
        if (!o->p8c) return 0;
        if (!func_02097ea4(o->strm, o->off18, 0)) return 0;
        n = func_02097f10(o->strm, o->p8c, o->len1c);
        if (n != o->len1c) return 0;
        o->p84 = func_020897fc(ctx, o->len24, func_02088ff0, o, 0);
        if (!o->p84) return 0;
        if (!func_02097ea4(o->strm, o->off20, 0)) return 0;
        n = func_02097f10(o->strm, o->p84, o->len24);
        if (n != o->len24) return 0;
        if (flag && o->len14) {
            o->p88 = func_020897fc(ctx, o->len14, func_02088fe4, o, 0);
            if (!o->p88) return 0;
            if (!func_02097ea4(o->strm, o->off10, 0)) return 0;
            n = func_02097f10(o->strm, o->p88, o->len14);
            if (n != o->len14) return 0;
        }
    }
    return 1;
}
