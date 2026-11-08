typedef struct {
    unsigned short id;
    unsigned short side:1;
    unsigned short kind:5;
    unsigned short rest:10;
    unsigned short pad:6;
    unsigned short value:9;
    unsigned short tail:1;
} Card;
typedef struct {
    unsigned int id:13;
    unsigned int flag:1;
    unsigned int pad:8;
    unsigned int value:8;
    unsigned int tail:2;
} Slot;
extern char data_ov002_022cf16c[];
extern int func_ov002_021b8fcc(int a0, int a1);
extern int func_ov002_021c2084(Card *card, int side, int slot, int check);
int func_ov002_021efd78(Card *card, int side, int index)
{
    Slot *slot;
    int pos;
    int off;
    if (card->side != side) return 0;
    if (index < 5) {
        if (func_ov002_021b8fcc(side, index) == 0) return 0;
    }
    pos = index * 0x14;
    off = (side & 1) * 0x868;
    slot = (Slot *)(off + (unsigned int)data_ov002_022cf16c + 0x30);
    if (((Slot *)((char *)slot + pos))->id == 0) return 0;
    if (((Slot *)((char *)slot + pos))->value * 2 + ((Slot *)((char *)slot + pos))->flag == card->value) return 0;
    return func_ov002_021c2084(card, side, index, 1) != 0;
}
