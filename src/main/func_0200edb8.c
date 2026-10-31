typedef struct Obj Obj;
typedef Obj Arg;
typedef struct { char pad[0x20]; int value; } Entry;
typedef struct { int value; char pad[0xc]; } Entry2;
struct Obj {
    char pad0[0x18]; void *items;
    char pad1[0x2c]; int sx, sy, sz;
    void (*callback)(Obj *, int);
    int (*callback2)(Obj *);
    Obj *self;
    unsigned int flags;
    char pad2[8]; int a,b,c,d;
    unsigned int flags2;
    char pad3[0x3c]; Entry entries[8];
    char pad4[0xc]; Entry2 entries2[8];
    char pad5[4]; int global8, global10;
    char pad6[0x10];
};
extern int data_02186ae8[];
extern void Fill32(int value, void *dst, int size);
extern int func_0201083c(Arg *arg);
extern void func_0200da18(Obj *obj, int idx);
extern int func_0200ade8(Obj *p);
Obj *func_0200edb8(Obj *o) {
    int i;
    o->global8 = data_02186ae8[2];
    o->global10 = data_02186ae8[4];
    if (o->items != 0 && func_0201083c(o) == 0) {
        Fill32(0, o, 0x284);
        return 0;
    }
    o->flags = (o->flags & ~1) | 5;
    o->sx = 0x1000; o->sy = 0x1000; o->sz = 0x1000;
    o->callback = func_0200da18;
    o->callback2 = func_0200ade8;
    o->self = o;
    for (i = 0; i < 8; i++) o->entries[i].value = -1;
    for (i = 0; i < 8; i++) o->entries2[i].value = -1;
    o->a = -1; o->b = -1; o->c = -1;
    o->d = 0;
    o->flags2 |= 0x20000000;
    return o;
}


