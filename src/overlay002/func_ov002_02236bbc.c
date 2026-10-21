struct Global { char pad[0x5a8]; int state; int count; };
struct Mode { char pad[0xcec]; int side; };
struct Count { int value; char pad[0x864]; };
struct Record { unsigned int card:13; unsigned int bit:1; unsigned int pad:8; unsigned int value:8; unsigned int top:2; };
struct Side { char pad[0x5d0]; struct Record records[166]; };
extern struct Global data_ov002_022ce288;
extern struct Mode data_ov002_022d016c;
extern struct Count data_ov002_022cf188[];
extern char data_ov002_022cf16c[];
extern int func_ov002_021d8204(unsigned int arg0, unsigned int arg1);
extern int func_ov002_021e286c(int arg0);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
int func_ov002_02236bbc(void) {
    int side = data_ov002_022d016c.side ^ data_ov002_022ce288.count;
    struct Record *r;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        data_ov002_022ce288.count = 0;
        func_ov002_021e2b3c(0);
        return 0x7f;
    case 0x7f:
        if (data_ov002_022cf188[side & 1].value == 0) return 0x7d;
    case 0x7e:
        if (data_ov002_022cf188[side & 1].value != 0) {
            r = &((struct Side *)(data_ov002_022cf16c + (side & 1) * 0x868))->records[data_ov002_022cf188[side & 1].value - 1];
            func_ov002_021d8204(side, r->value * 2 + r->bit);
            return 0x7e;
        }
        func_ov002_021e286c(side);
        return 0x7d;
    case 0x7d:
        if (++data_ov002_022ce288.count < 2) return 0x7f;
        func_ov002_021e2c5c(data_ov002_022ce288.count);
        return 0;
    }
    return 0;
}

