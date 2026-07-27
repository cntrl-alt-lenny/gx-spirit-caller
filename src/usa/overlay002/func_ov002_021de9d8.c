extern char data_ov002_022cf08c[];
extern int func_ov002_021de044(int a, unsigned int mask, int k1, int k2);

struct Ov002SlotBit { unsigned int id : 13; unsigned int b13 : 1; };

int func_ov002_021de9d8(int a, int side, int idx) {
    char *row = data_ov002_022cf08c + (side & 1) * 0x868;
    struct Ov002SlotBit *s = (struct Ov002SlotBit *)(row + idx * 0x14 + 0x30);
    int bit13 = s->b13;
    int shift = idx + side * 16;
    unsigned int mask = 1u << shift;
    unsigned int extra = (side == bit13) ? 0x40000 : 0;
    return (func_ov002_021de044(a, mask, 0xd, extra) & mask) ? 1 : 0;
}
