struct F02201564_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F02201564_Self {
    unsigned short f0;
    struct F02201564_F2 f2;
    unsigned char pad4[0x10];
    unsigned int f14_lo : 9;
    unsigned int a : 1;
    unsigned int b : 4;
    unsigned int f14_hi : 18;
};

struct F02201564_Ent {
    unsigned char pad[0x30];
    unsigned int v : 13;
    unsigned int rest : 19;
};

extern unsigned char data_ov002_022cf16c[];
extern int func_ov002_021bcd80(unsigned int bit0, int key);

int func_ov002_02201564(struct F02201564_Self *self, int arg) {
    struct F02201564_Ent *p;
    if (arg != 0) {
        return 0;
    }
    switch (self->f2.tag6) {
    case 0x1f:
    case 0x20:
    case 0x21:
        p = (struct F02201564_Ent *)(data_ov002_022cf16c + (self->a & 1) * 0x868 + self->b * 0x14);
        if (p->v == 0) {
            return 0;
        }
        return func_ov002_021bcd80(self->f2.bit0, (unsigned short)((unsigned char)self->a | ((unsigned char)self->b << 8))) != 0;
    default:
        return 0;
    }
}
