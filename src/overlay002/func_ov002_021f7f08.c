struct S7f08 {
    unsigned short f0;
    unsigned short side : 1;
    unsigned short idx : 5;
    unsigned short type : 6;
    unsigned short rest : 4;
};

struct G288 {
    char pad[0x5b4];
    int state;
};

struct G178 {
    int first;
    char pad[0x864];
};

extern struct G288 data_ov002_022ce288;
extern struct G178 data_ov002_022cf178[];

extern int func_ov002_021de8fc(struct S7f08 *self, unsigned int mask, int c);
extern void func_ov002_021d7c88(int side, int b);

int func_ov002_021f7f08(struct S7f08 *self) {
    if (self->type == 0x23) return 1;
    switch (data_ov002_022ce288.state) {
    case 0: {
        int sh = self->side << 4;
        func_ov002_021de8fc(self, ~(1 << (sh + self->idx)) & (0xffff << sh), 0);
        data_ov002_022ce288.state++;
        return 0;
    }
    case 1:
        if (data_ov002_022cf178[self->side & 1].first != 0) {
            func_ov002_021d7c88(self->side, 0);
            return 0;
        }
        data_ov002_022ce288.state++;
        return 0;
    }
    return 1;
}
