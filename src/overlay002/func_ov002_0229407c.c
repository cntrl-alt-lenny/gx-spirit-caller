struct F_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 15;
};

struct F_Self {
    unsigned short f0;
    struct F_F2 f2;
};

extern char data_ov002_022cf16c[];
extern int func_ov002_02280df4(struct F_Self *self, int a, int b, int c);
extern int func_ov002_021b3014(int a, int b, int c);
extern int func_ov002_021c8470(int a, int b);

int func_ov002_0229407c(struct F_Self *self) {
    int idx;
    unsigned int b = self->f2.bit0;
    if (*(int *)(data_ov002_022cf16c + (b & 1) * 0x868) <
        *(int *)(data_ov002_022cf16c + ((1 - b) & 1) * 0x868)) {
        idx = func_ov002_02280df4(self, self->f2.bit0, -1, 0);
        if (func_ov002_021b3014(self->f2.bit0, idx, 0x1237)) {
            idx = func_ov002_02280df4(self, self->f2.bit0, idx, 0);
        }
        if (idx >= 0) {
            if (func_ov002_021c8470(self->f2.bit0, idx) >= 0x5dc) {
                return 1;
            }
        }
        return 0;
    } else {
        return 0;
    }
}
