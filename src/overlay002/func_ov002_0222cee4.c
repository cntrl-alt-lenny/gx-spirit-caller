struct Ov002W2 {
    unsigned short a : 1;
    unsigned short idx : 5;
    unsigned short rest : 10;
};

struct Ov002W4 {
    unsigned short b0 : 1;
    unsigned short b1 : 1;
    unsigned short b2 : 1;
    unsigned short b3 : 1;
    unsigned short mid : 2;
    unsigned short val : 9;
    unsigned short top : 1;
};

struct Ov002Ent {
    unsigned short w0;
    struct Ov002W2 w2;
    struct Ov002W4 w4;
};

struct Ov002Ce288 {
    char pad[0x5a8];
    int mode;
};

extern struct Ov002Ce288 data_ov002_022ce288;
extern void func_ov002_021d8904(int a, int b, int c);
extern int func_ov002_021de598(int a, int b, int c);
extern int func_ov002_021e104c(int a, int b);

int func_ov002_0222cee4(struct Ov002Ent *self, struct Ov002Ent *ent) {
    int mode = data_ov002_022ce288.mode;
    if (mode != 0x7f) {
        if (mode == 0x80) {
            ent->w4.b1 = 1;
            ent->w4.b2 = ent->w4.b1;
            ent->w4.b3 = ent->w4.b2;
            func_ov002_021d8904(ent->w2.a, ent->w2.idx, ent->w4.val);
            if (ent->w2.idx <= 10) {
                if (func_ov002_021de598((int)self, ent->w2.a, ent->w2.idx) != 0) {
                    return 0x7f;
                }
            }
        }
    } else {
        func_ov002_021e104c(self->w2.a, 1);
    }
    return 0;
}
