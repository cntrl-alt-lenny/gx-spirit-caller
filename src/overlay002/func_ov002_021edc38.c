typedef struct { unsigned short id; unsigned short side:1; unsigned short rest:15; } Card;
typedef struct { unsigned int id:13; unsigned int flag:1; unsigned int pad:8; unsigned int value:8; unsigned int rest:2; } Slot;
typedef struct { unsigned short pad:6; unsigned short value:9; unsigned short rest:1; } Value;
extern char data_ov002_022cf16c[];
extern int func_ov002_021b8fcc(int a0, int a1);
extern int func_ov002_021c1ef0(Card *card, int side, int slot);
int func_ov002_021edc38(Card *card, int side, int slot) {
    int off;
    int pos;
    Slot *row;
    if (slot < 5) {
        if (func_ov002_021b8fcc(side, slot) == 0) return 0;
    }
    off = (side & 1) * 0x868;
    pos = slot * 0x14;
    row = (Slot *)(off + (unsigned int)data_ov002_022cf16c + 0x30);
    if (((Slot *)((char *)row + pos))->id == 0) return 0;
    if (((Slot *)((char *)row + pos))->value * 2 + ((Slot *)((char *)row + pos))->flag == ((Value *)((char *)card + 4))->value) return 0;
    return func_ov002_021c1ef0(card, side, slot) != 0;
}

