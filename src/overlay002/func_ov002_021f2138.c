typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;
    unsigned short field : 5;
    unsigned short : 10;
} Card021c1e44;
typedef struct { unsigned int lo : 13; unsigned int rest : 19; } Bits;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
/* This caller sets only r0 and r1; the callee definition takes four arguments. */
extern int func_ov002_021c8940();
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
int func_ov002_021f2138(Card021c1e44 *self, int player, int slot) {
    int side;
    int off;
    if (slot >= 5) return 0;
    if (player == self->flag0) return 0;
    side = (player & 1) * 0x868;
    off = slot * 20;
    if (((Bits *)((data_ov002_022cf16c + side + 0x30) + off))->lo == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + side + off) == 0) return 0;
    if (func_ov002_021c8940(player, slot) != 7) return 0;
    return func_ov002_021c1e44(self, player, slot) == 0;
}


