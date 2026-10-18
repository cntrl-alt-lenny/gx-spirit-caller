struct Ov002Obj {
    unsigned short f0;
    struct {
        unsigned short side : 1;
        unsigned short rest : 15;
    } f2;
    unsigned short pad4[4];
    unsigned short fc;
};

struct Ov002State {
    char pad[0x5b4];
    int step;
};

struct Ov002Slot {
    int val;
    char pad[0x864];
};

extern struct Ov002State data_ov002_022ce288;
extern struct Ov002Slot data_ov002_022cf178[];

extern void func_ov002_021e2b3c(int step);
extern void func_ov002_021e2c5c(int side);
extern void func_ov002_021d7a1c(int side, int arg);

int func_ov002_021f9bd0(struct Ov002Obj *a, struct Ov002Obj *b) {
    int side;
    switch (data_ov002_022ce288.step) {
    case 0:
        func_ov002_021e2b3c(data_ov002_022ce288.step);
        data_ov002_022ce288.step++;
        return 0;
    case 1:
        side = a->f2.side;
        if (data_ov002_022cf178[side & 1].val != 0) {
            func_ov002_021d7a1c(side, 0);
            return 0;
        }
        func_ov002_021e2c5c(side);
        if (b->f0 == 0x14e0) {
            a->fc = b->fc;
        }
        data_ov002_022ce288.step++;
        return 0;
    default:
        return 1;
    }
}
