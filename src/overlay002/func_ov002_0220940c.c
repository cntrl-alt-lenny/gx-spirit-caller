typedef unsigned short u16;

struct SA0 {
    u16 pad0;
    u16 bit0 : 1;
    u16 f1_5 : 5;
    u16 f6_11 : 6;
    u16 rest : 4;
    u16 pad4 : 6;
    u16 f6_14 : 9;
    u16 rest2 : 1;
};

struct Ent {
    unsigned int pad0 : 13;
    unsigned int lo : 1;
    unsigned int pad1 : 8;
    unsigned int hi : 8;
    unsigned int pad2 : 2;
    int rest[4];
};

extern char data_ov002_022cf16c[];
extern int func_ov002_021b9e00(int a, int b);
extern int func_ov002_021b4098(int a, int b, int c);
extern int func_ov002_02208bfc(struct SA0 *a, int b);

int func_ov002_0220940c(struct SA0 *a, int b) {
    struct Ent *e = (struct Ent *)(data_ov002_022cf16c + (a->bit0 & 1) * 0x868 + 0x30);
    if (a->f6_14 != e[a->f1_5].hi * 2 + e[a->f1_5].lo) {
        return 0;
    }
    if (a->f6_11 == 0x19) {
        return func_ov002_021b9e00(a->bit0, a->f1_5) < 5;
    }
    if (func_ov002_021b4098(a->bit0, a->f1_5, 0x181a) == 0) {
        return 0;
    }
    if (func_ov002_021b9e00(a->bit0, a->f1_5) < 5) {
        return 0;
    }
    return func_ov002_02208bfc((struct SA0 *)a, b);
}
