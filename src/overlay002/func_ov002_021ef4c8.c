typedef struct { unsigned short id; unsigned short side:1; unsigned short rest:15; } Card;
typedef struct {
    unsigned short f0;
    unsigned short flag0:1;
    unsigned short field:5;
    unsigned short :10;
} Card021c1e44;
typedef struct { unsigned int id:13; unsigned int rest:19; } Slot;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cd3f4[];
extern int func_ov002_021c1ef0(Card *card, int side, int slot);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
int func_ov002_021ef4c8(Card *card, int side, int slot) {
    int off;
    int pos;
    if (side == card->side) return 0;
    if (slot >= 5) return 0;
    off = (side & 1) * 0x868;
    pos = slot * 0x14;
    if (((Slot *)(data_ov002_022cf16c + off + 0x30 + pos))->id == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + pos) == 0) return 0;
    if (*(int *)data_ov002_022cd3f4 != side || *(int *)(data_ov002_022cd3f4 + 0x1c) != slot) return 0;
    if (func_ov002_021c1ef0(card, side, slot) == 0) return 0;
    return func_ov002_021c1e44((Card021c1e44 *)card, side, slot) == 0;
}

