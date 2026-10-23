typedef struct {
    unsigned short id;
    unsigned short side:1;
    unsigned short kind:5;
    unsigned short rest:10;
    unsigned short :6;
    unsigned short identity:9;
    unsigned short :1;
} Card;
typedef struct {
    unsigned short f0;
    unsigned short flag0:1;
    unsigned short field:5;
    unsigned short :10;
} Card021c1e44;
typedef struct {
    unsigned int id:13;
    unsigned int flag:1;
    unsigned int :8;
    unsigned int kind:8;
    unsigned int :2;
} Slot;
extern char data_ov002_022cf16c[];
extern int func_ov002_021c1ef0(Card *card, int side, int slot);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern int func_ov002_021c2084(Card *card, int side, int slot, int check);
int func_ov002_021f17d4(Card *self, int player, int idx) {
    int off = (player & 1) * 0x868;
    int pos = idx * 0x14;
    if (((Slot *)(data_ov002_022cf16c + off + 0x30 + pos))->id == 0) return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0) return 0;
    if (((Slot *)(data_ov002_022cf16c + off + 0x30 + pos))->kind * 2 + ((Slot *)(data_ov002_022cf16c + off + 0x30 + pos))->flag == self->identity) return 0;
    if (func_ov002_021c1e44((Card021c1e44 *)self, player, idx) != 0) return 0;
    return func_ov002_021c2084(self, player, idx, 1) != 0;
}


