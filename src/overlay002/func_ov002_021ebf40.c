typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;
    unsigned short field : 5;
    unsigned short : 10;
} Card021c1e44;
typedef struct { unsigned int cnt : 13; unsigned int : 19; char pad[16]; } Bits;
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
int func_ov002_021ebf40(Card021c1e44 *a0, int a1, int a2) {
    int off;
    int o;
    if (a2 >= 5) return 0;
    if (a1 == a0->flag0) return 0;
    off = (a1 & 1) * 0x868;
    o = a2 * 0x14;
    if (((Bits *)(data_ov002_022cf16c + off + 0x30))[a2].cnt == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + o) == 0) return 0;
    return func_ov002_021c1e44(a0, a1, a2) == 0;
}



