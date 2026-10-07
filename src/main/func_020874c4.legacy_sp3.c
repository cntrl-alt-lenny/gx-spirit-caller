struct Obj { int f0; int pad4; int f8; int fc; int f10; };

extern int func_02095554(int a);
extern int func_02095cfc(void);

int func_020874c4(struct Obj *o)
{
    if (o->f8 == 0) {
        return 0;
    }
    if (o->fc == 0) {
        if (func_02095554(o->f10) == 0) {
            return 1;
        }
        o->fc = 1;
    }
    if ((1 << o->f0) & func_02095cfc()) {
        return 1;
    }
    o->f8 = 0;
    return 0;
}
