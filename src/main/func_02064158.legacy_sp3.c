typedef struct {
    char _0[0xc];
    int state;
    char _10[0x8c];
    void *f9c;
} Obj;
typedef struct Self02061798 Self02061798;
typedef struct Self02061b60 Self02061b60;
extern int func_02054140(void *p);
extern int func_02061798(Self02061798 *self, int arg1, int arg2, int arg3, int arg4);
extern int func_02061b60(Self02061b60 *self, int a, int b, int c);
extern int func_020643d8(int a, int unused1, int unused2, int d);

int func_02064158(Obj *o, int a, int b) {
    int state = o->state;
    if (state != 5 && state != 6) {
        if (func_020643d8((int)o, a, b, state) == 0) {
            return 0;
        }
    } else {
        if (func_02054140(o->f9c) != 0) {
            return func_02061798((Self02061798 *)o, 0, a, b, 1) != 0;
        }
        if (func_02061b60((Self02061b60 *)o, a, b, 1) == 0) {
            return 0;
        }
    }
    return 1;
}
