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

struct Row {
    unsigned int lo : 13;
    unsigned int b13 : 1;
    unsigned int gap : 8;
    unsigned int mid : 8;
    unsigned int top : 2;
    char pad[0x10];
};

struct Side {
    char pad[0x30];
    struct Row rows[104];
    char pad2[0x18];
};

extern struct Side data_ov002_022cf16c[];
extern void func_ov002_021d8904(int a, int b, int c);
extern void func_ov002_021d63fc(int a, int b, int c, int d);

int func_ov002_022368e8(int self, struct Ov002Ent *ent) {
    struct Side *s = data_ov002_022cf16c;
    struct Row *r;
    unsigned int val;
    ent->w4.b1 = 1;
    ent->w4.b2 = ent->w4.b1;
    ent->w4.b3 = ent->w4.b2;
    r = &s[ent->w2.a & 1].rows[ent->w2.idx];
    if ((r->mid * 2 + r->b13) == ent->w4.val) {
        func_ov002_021d8904(ent->w2.a, ent->w2.idx, ent->w4.val);
        func_ov002_021d63fc(self, ent->w2.a, ent->w2.idx, 0);    }
    return 0;
}
