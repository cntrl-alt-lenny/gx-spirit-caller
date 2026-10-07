struct Obj {
    int pad0;
    int pad4;
    void (*f8)(void);
    struct Obj *fc;
    int pad10;
    void (*f14)(void);
    struct Obj *f18;
    char pad1c[8];
    unsigned f24;
    char pad28[0x1c];
    int f44;
    int f48;
};

extern int data_021a5134;
extern char data_021a5138[];
extern void func_0207d1b8(void *p, int a);
extern void func_02088000(void);
extern void func_02088070(void);

void func_020885a0(struct Obj *o)
{
    if (data_021a5134 == 0) {
        func_0207d1b8(data_021a5138, 0);
        data_021a5134 = 1;
    }
    o->f8 = func_02088070;
    o->fc = o;
    o->f14 = func_02088000;
    o->f18 = o;
    o->f44 = 0;
    o->f48 = 0;
    o->f24 &= ~1;
    o->f24 &= ~2;
}
