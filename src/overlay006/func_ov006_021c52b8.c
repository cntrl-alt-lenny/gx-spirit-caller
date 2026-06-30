struct Ov006GState {
    char pad0[0xc];
    int f_c, f_10, f_14, f_18, f_1c;
    char pad20[0x6c - 0x20];
    int f_6c;
    char pad70[0x8c - 0x70];
    int f_8c, f_90, f_94, f_98;
    char pad9c[0x24c - 0x9c];
    int f_24c;
};

extern struct Ov006GState data_ov006_0225dc14;
extern char data_020fdb90[];
extern char data_020fdd80[];
extern int func_020211c8(void *);
extern void func_0202147c(void);
extern int func_ov006_021c5cc0(void *);
extern int func_ov006_021c5d00(void *);
extern int func_ov006_021c5f44(void *);
extern int func_ov006_021c6454(void *);
extern int func_ov006_021c669c(void *);
extern int func_ov006_021c6798(void *);
extern int func_ov006_021c6840(void *);

struct Ov006Obj {
    int f_0, f_4;
    char pad8[0x4c - 0x8];
    int f_4c, f_50, f_54;
    char pad58[0x6c - 0x58];
    int f_6c, f_70, f_74, f_78;
};

int func_ov006_021c52b8(struct Ov006Obj *obj) {
    int zero = 0;

    obj->f_50 = zero;
    if (obj->f_54 != 0) {
        struct Ov006GState *g = &data_ov006_0225dc14;
        g->f_6c = g->f_c;
        g->f_8c = g->f_10;
        g->f_90 = g->f_14;
        g->f_94 = g->f_18;
        g->f_98 = g->f_1c;
    } else {
        int v;
        int bit = zero;
        struct Ov006GState *g;

        obj->f_4c = zero;
        obj->f_6c = zero;
        g = &data_ov006_0225dc14;
        obj->f_70 = zero;
        v = g->f_24c;
        obj->f_74 = v;
        if (v > 6) {
            bit = 1;
        }
        obj->f_78 = (obj->f_78 & ~1) | (bit & 1);
    }
    if (obj->f_4 == 0) {
        obj->f_4 = func_020211c8(data_020fdb90);
        func_0202147c();
    }
    if (obj->f_0 == 0) {
        obj->f_0 = func_020211c8(data_020fdd80);
        func_0202147c();
    }
    func_ov006_021c5cc0(obj);
    func_ov006_021c5d00(obj);
    func_ov006_021c5f44(obj);
    func_ov006_021c6454(obj);
    func_ov006_021c669c(obj);
    func_ov006_021c6798(obj);
    func_ov006_021c6840(obj);
    return 1;
}
