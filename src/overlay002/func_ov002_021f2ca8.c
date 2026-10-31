typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;
    unsigned short field : 5;
    unsigned short : 10;
    unsigned short : 6;
    unsigned short value : 9;
    unsigned short : 1;
} Card021c1e44;
struct Bits { unsigned id:13; unsigned low:1; unsigned :8; unsigned high:8; unsigned :2; };
struct Entry { struct Bits bits; char pad[16]; };
struct Player { char pad[48]; struct Entry cards[5]; char tail[2004]; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
int func_ov002_021f2ca8(Card021c1e44 *self, int player, int slot) {

    int side;
    int off;
    if (self->flag0 != player) return 0;
    side = (player & 1) * 0x868;
    off = slot * 0x14;

    if (((struct Player *)data_ov002_022cf16c)[player & 1].cards[slot].bits.id == 0) return 0;
    if (((struct Player *)data_ov002_022cf16c)[player & 1].cards[slot].bits.high * 2 + ((struct Player *)data_ov002_022cf16c)[player & 1].cards[slot].bits.low == self->value) return 0;
    return func_ov002_021c1e44(self, player, slot) == 0;
}



