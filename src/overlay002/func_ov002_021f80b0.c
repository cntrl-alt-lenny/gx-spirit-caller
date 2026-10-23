struct Self {
    unsigned short f0;
    unsigned short side : 1;
    unsigned short idx : 5;
    unsigned short type : 6;
    unsigned short rest : 4;
};
struct State { char pad[0x5b4]; int state; };
struct Entry { int first; char pad[0x864]; };
extern struct State data_ov002_022ce288;
extern struct Entry data_ov002_022cf178[];
extern void func_ov002_021ded30(unsigned short *p, int arg1);
extern void func_ov002_021d7c40(void *arg0, int arg1);
int func_ov002_021f80b0(struct Self *self) {
    if (self->type != 0x23) {
    switch (data_ov002_022ce288.state) {
    case 0: {
        int sh = self->side << 4;
        func_ov002_021ded30(&self->f0, (1 << (sh + self->idx)) ^ (0xffff << sh));
        data_ov002_022ce288.state++;
        return 0;
    }
    case 1:
        if (data_ov002_022cf178[self->side & 1].first != 0) {
            func_ov002_021d7c40((void *)self->side, 0);
            return 0;
        }
        data_ov002_022ce288.state++;
        return 0;
    }
    }
    return 1;
}

