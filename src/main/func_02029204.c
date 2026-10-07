typedef struct {
    char pad0[0x19a];
    unsigned short b0 : 1;
    unsigned short b1 : 1;
    unsigned short b2 : 1;
    unsigned short b3 : 1;
    unsigned short b4 : 1;
    unsigned short b5 : 1;
    unsigned short b6 : 1;
} Obj;

extern void func_020294c0(Obj *o);
extern void func_02029a88(Obj *o);
extern void func_02029f74(Obj *o);

int func_02029204(Obj *o) {
    if (o->b0 && o->b1) {
        if (o->b2) {
            if (!o->b5 || !o->b6) {
                func_020294c0(o);
            }
        } else {
            func_02029a88(o);
        }
        if (o->b4 && *(int *)((char *)o + 0x188) != 0) {
            func_02029f74(o);
        }
    }
    return 1;
}
