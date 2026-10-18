struct F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

struct B2 {
    unsigned short bit0 : 1;
    unsigned short pad : 13;
    unsigned short bit14 : 1;
    unsigned short rest : 1;
};

struct Self {
    unsigned short f0;
    struct F2 f2;
};

struct Other {
    unsigned short f0;
    struct B2 f2;
    unsigned short f4;
    unsigned short cnt : 8;
    unsigned short cnthi : 8;
};

struct Ent {
    unsigned short id : 13;
    unsigned short rest : 3;
    unsigned short pad;
};

extern struct Ent data_ov002_022d0250[];
extern int func_0202e234(int x);
extern int func_ov002_0223de94(struct Other *o, int i);
extern int func_ov002_0223def4(struct Other *o, int i);

int func_ov002_022076a0(struct Self *self, struct Other *other) {
    int i;
    if (!other)
        return 0;
    if (1 - self->f2.bit0 != (other->f2.bit0 ^ other->f2.bit14))
        return 0;
    for (i = 0; i < other->cnt; i++) {
        if (((((unsigned short)func_ov002_0223de94(other, i)) >> 8) & 0xff) == 0xe) {
            if (func_0202e234(data_ov002_022d0250[func_ov002_0223def4(other, i)].id) != 0)
                return 1;
        }
    }
    return 0;
}
