struct F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

struct F4 {
    unsigned short pad : 6;
    unsigned short field9 : 9;
    unsigned short rest : 1;
};

struct Slot {
    unsigned int pad : 17;
    unsigned int flag : 1;
    unsigned int rest : 14;
};

struct Self {
    unsigned short f0;
    struct F2 f2;
    struct F4 f4;
};

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_ov002_021b99b4(unsigned int bit, unsigned int f4);
extern int func_ov002_021b3fd8(int a, int b, int c, int d);

int func_ov002_0220532c(struct Self *self) {
    int idx = func_ov002_021b99b4(self->f2.bit0, self->f4.field9);
    unsigned int side;
    if (idx < 0)
        return 0;
    side = self->f2.bit0;
    if (!((struct Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x418 + idx * 4))->flag)
        return 0;
    if (func_ov002_021b3fd8(side, 0xb, self->f0, self->f4.field9) != 0)
        return 0;
    return *(int *)(data_ov002_022cf178 + ((1 - self->f2.bit0) & 1) * 0x868) != 0;
}
