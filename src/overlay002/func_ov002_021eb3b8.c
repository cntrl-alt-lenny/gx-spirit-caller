typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;
    unsigned short field : 5;
    unsigned short kind : 6;
    unsigned short : 4;
    unsigned char pad[16];
    unsigned int : 9;
    unsigned int side : 1;
    unsigned int slot : 4;
    unsigned int : 18;
} Card021c1e44;
typedef struct { unsigned int cnt : 13; unsigned int : 19; } Bits;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c1ef0(void *a0, int a1, int a2);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021c84a8(int a, int b);
int func_ov002_021eb3b8(Card021c1e44 *a0, int a1, int a2) {
    int side;
    int idx;
    if (a1 == a0->flag0) return 0;
    side = (a1 & 1) * 0x868;
    idx = a2 * 0x14;
    if (((Bits *)(data_ov002_022cf16c + side + 0x30 + idx))->cnt == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + side + idx) == 0) return 0;
    if (func_ov002_021c1ef0(a0, a1, a2) == 0) return 0;
    if (func_ov002_021c1e44(a0, a1, a2) != 0) return 0;
    if ((unsigned short)(a0->kind + 0xfffa) <= 1) {
        if (a1 != a0->side) return 0;
        if (a2 != a0->slot) return 0;
        switch (a0->f0) {
        case 0x12e4: return func_ov002_021c8470(a1, a2) >= 1000;
        case 0x124f: return func_ov002_021c84a8(a1, a2) <= 500;
        case 0x1250: return func_ov002_021c8470(a1, a2) <= 500;
        }
    }
    return 0;
}
