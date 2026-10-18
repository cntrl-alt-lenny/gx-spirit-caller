typedef unsigned short u16;
typedef unsigned int u32;

struct Obj {
    u16 f0;
    u16 bit0 : 1;
};

struct Data {
    char pad[0xcec];
    u32 fcec;
    char pad2[8];
    u32 fcf8;
};

extern struct Data data_ov002_022d016c;
extern int func_ov002_021ff354(struct Obj *p, int q);

int func_ov002_0220599c(struct Obj *p, int q) {
    if (data_ov002_022d016c.fcec != p->bit0) {
        return 0;
    }
    if (data_ov002_022d016c.fcf8 != 1) {
        return 0;
    }
    return func_ov002_021ff354(p, q);
}
