typedef struct { unsigned short id; unsigned short side:1; unsigned short rest:15; } Card;
typedef struct { unsigned short f0; unsigned short flag0:1; unsigned short field:5; unsigned short :10; } Card021c1e44;
typedef struct { unsigned int id:13; unsigned int rest:19; char pad[16]; } Slot;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_0202e2f8(int unused0);
extern int func_ov002_021c1ef0(Card *card, int side, int slot);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
int func_ov002_021f0028(Card *card, int side, int index) {
    int off = (side & 1) * 0x868;
    int pos = index * 0x14;
    int id = ((Slot *)(data_ov002_022cf16c + off + 0x30))[index].id;
    if (id == 0) return 0;
    if (index >= 5) return 0;
    if (side == card->side) return 0;
    if (func_0202e2f8(id) != 0) return 0;
    if (func_ov002_021c1ef0(card, side, index) == 0) return 0;
    if (func_ov002_021c1e44((Card021c1e44 *)card, side, index) != 0) return 0;
    return *(unsigned short *)(data_ov002_022cf1a4 + off + pos) != 0;
}


