typedef unsigned int u32;
extern char data_ov002_022cf16c[];

struct Ov002287Self {
    unsigned short f_0;
    unsigned short f2_b0 : 1;
    unsigned short : 15;
    unsigned short f_4;
};

extern int func_ov002_021bc618(unsigned bit);
extern int func_ov002_021ca2b8(unsigned bit);
extern int func_ov002_021b99b4(unsigned bit, unsigned field9);
extern int func_ov002_021c33e4(int bit, int bit2, int idx);
extern void func_ov002_0227adb8(u32 bit, void *p, int one, u32 w);

int func_ov002_022287c4(struct Ov002287Self *self) {
    int idx;
    char *ptr;

    if (!func_ov002_021bc618(self->f2_b0)) {
        return 0;
    }
    if (!func_ov002_021ca2b8(self->f2_b0)) {
        return 0;
    }
    idx = func_ov002_021b99b4(self->f2_b0, ((unsigned)(self->f_4 << 17)) >> 23);
    if (idx >= 0) {
        if (func_ov002_021c33e4(self->f2_b0, self->f2_b0, idx)) {
            ptr = data_ov002_022cf16c + (self->f2_b0 & 1) * 0x868 + 0x418 + idx * 4;
            func_ov002_0227adb8(self->f2_b0, ptr, 1, self->f_0 << 16);
        }
    }
    return 0;
}
