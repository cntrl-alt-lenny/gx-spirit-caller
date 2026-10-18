struct F0220b8e8_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};

struct F0220b8e8_Self {
    unsigned short f0;
    struct F0220b8e8_F2 f2;
    unsigned char pad4[0x10];
    unsigned int idx : 9;
    unsigned int a : 1;
    unsigned int mid : 7;
    unsigned int flag : 1;
    unsigned int hi : 14;
};

struct F0220b8e8_Slot {
    unsigned short id : 13;
    unsigned short rest : 3;
    unsigned short pad;
};

extern struct F0220b8e8_Slot data_ov002_022d0250[];
extern int func_ov002_021bcd80(unsigned int bit0, int key);
extern int func_0202e2c8(int id);
extern int func_02030b84(int id);

int func_ov002_0220b8e8(struct F0220b8e8_Self *self) {
    int id;
    if (func_ov002_021bcd80(self->f2.bit0, -1) == 0) {
        return 0;
    }
    if (self->f2.tag6 == 8) {
        id = data_ov002_022d0250[self->idx].id;
        if (self->a != 1 - self->f2.bit0) {
            return 0;
        }
        if (func_0202e2c8(id) == 0) {
            return 0;
        }
        if (func_02030b84(id) == 0) {
            return 0;
        }
        return self->flag != 0;
    }
    return 0;
}
