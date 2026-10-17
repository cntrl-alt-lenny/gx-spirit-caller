typedef struct Obj {
    int f0;
    int pad4;
    int f8;
    int fc;
    int f10;
} Obj;

extern int func_02095cfc(void);
extern int func_020955a8(void);
extern void func_02095678(int a);
extern int func_020955e8(int a);

int func_02087444(Obj *o)
{
    int t;
    int r;
    if (o->f8 == 0) {
        r = (1 << o->f0) & func_02095cfc();
        if (r == 0) {
            return r;
        }
        t = func_020955a8();
        func_02095678(1);
        return func_020955e8(t);
    }
    if (o->fc == 0) {
        func_020955e8(o->f10);
        o->fc = 1;
    }
    do {
        r = (1 << o->f0) & func_02095cfc();
    } while (r != 0);
    return r;
}
