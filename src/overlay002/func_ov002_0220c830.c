struct F0220C830_Ent {
    unsigned short v : 13;
    unsigned short rest : 3;
    unsigned short pad;
};

struct F0220C830_F14 {
    unsigned int idx  : 9;
    unsigned int flag : 1;
    unsigned int pad  : 9;
    unsigned int kind : 4;
    unsigned int rest : 9;
};

struct F0220C830_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F0220C830_Self {
    unsigned short f0;
    struct F0220C830_F2 f2;
    unsigned char pad[0x10];
    struct F0220C830_F14 f14;
};

extern struct F0220C830_Ent data_ov002_022d0250[];
extern int func_0202e234(int x);

int func_ov002_0220c830(struct F0220C830_Self *self) {
    if (self->f2.tag6 == 0x16) {
        if (self->f14.flag != self->f2.bit0) {
            return 0;
        }
        if (self->f14.kind != 0xe) {
            return 0;
        }
        return func_0202e234(data_ov002_022d0250[self->f14.idx].v) != 0;
    }
    return 0;
}
