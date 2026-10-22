struct Input {
    unsigned short value;
    unsigned short side : 1;
    unsigned short field : 5;
    unsigned short rest : 10;
};
struct Entry { unsigned int value; unsigned char pad[16]; };
struct Player { struct Entry entries[5]; unsigned char pad[0x804]; };
struct Life { unsigned int value; unsigned char pad[0x864]; };
extern unsigned char data_ov002_022ce288[];
extern struct Player data_ov002_022cf1a8[];
extern struct Life data_ov002_022cf178[];
extern void func_ov002_021e2d94(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_0226ad5c(int arg0, int arg1, int arg2, int arg3);
int func_ov002_022188b4(struct Input *p) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        func_ov002_021e2d94(p->side, p->field, 5, 0);
        return 0x7f;
    case 0x7f: {
        unsigned int limit;
        unsigned int value;
        int other;
        other = 1 - p->side;

        limit = data_ov002_022cf178[other & 1].value;
        value = data_ov002_022cf1a8[p->side & 1].entries[p->field].value + 1;

        func_ov002_0226ad5c(other, value < limit ? value : limit, 0, 1);
        return 0;
    }
    default: return 0;
    }
}




