typedef struct { unsigned int cnt:13; unsigned int rest:19; } Bits;
typedef struct {
    char pad0[4];
    unsigned short pad4:6;
    unsigned short target:9;
    unsigned short pad5:1;
    char pad6[14];
    unsigned int loc:16;
    unsigned int pad16:16;
} Card;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c2084(Card *, int, int, int);
extern int func_ov002_021b9830(int target);
extern int func_ov002_021b33b0(int, int, int, int);
int func_ov002_021ec41c(Card *p, int player, int idx) {
    int side;
    int off;
    int loc;
    int result;
    side = (player & 1) * 0x868;
    off = idx * 0x14;
    if (((Bits *)(data_ov002_022cf16c + side + 0x30 + off))->cnt == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + side + off) == 0) return 0;
    if (idx < 5) return 0;
    if (func_ov002_021c2084(p, player, idx, 0) == 0) return 0;
    loc = p->loc;
    if (player != (loc & 0xff)) return 0;
    if (idx != ((loc >> 8) & 0xff)) return 0;
    result = func_ov002_021b9830(p->target);
    if (result < 0) return 0;
    return func_ov002_021b33b0(player, idx, result & 0xff, ((unsigned short)result >> 8) & 0xff) != 0;
}

