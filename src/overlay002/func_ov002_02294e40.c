struct F02294e40_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F02294e40_Self {
    unsigned short f0;
    struct F02294e40_F2 f2;
};

struct F02294e40_Ent {
    int v;
    char pad[0x864];
};

extern struct F02294e40_Ent data_ov002_022cf16c[];
extern int func_ov002_021c3ae4(unsigned int a, int b);
extern int func_ov002_021bcf00(int a);

int func_ov002_02294e40(struct F02294e40_Self *self) {
    if (data_ov002_022cf16c[(1 - self->f2.bit0) & 1].v <= 0x960) return 1;
    if (func_ov002_021c3ae4(self->f2.bit0, 0x1894) != 0) return 1;
    return func_ov002_021bcf00(1 - self->f2.bit0) > 0;
}
