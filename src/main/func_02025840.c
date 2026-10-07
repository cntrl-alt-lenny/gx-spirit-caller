typedef struct {
    char pad0[0x16a];
    unsigned short b0 : 1;
    unsigned short b1 : 1;
} Obj;

extern int func_02025880(Obj *o);

int func_02025840(Obj *o) {
    if (o->b0 && o->b1) {
        return func_02025880(o) == 0;
    }
    return 0;
}
