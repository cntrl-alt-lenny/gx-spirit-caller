typedef struct { unsigned short id; unsigned short side:1; unsigned short kind:5; unsigned short rest:10; } Card;
typedef struct { unsigned int id:13; unsigned int rest:19; } Slot;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern unsigned int func_0202b878(int id);
extern int func_ov002_021b8fcc(int a0, int a1);
extern int func_ov002_021c1ef0(Card *card, int side, int slot);
extern int func_ov002_021c2084(Card *card, int side, int slot, int check);
int func_ov002_021eb530(Card *card, int side, int slot) {
    int off = (side & 1) * 0x868;
    int pos = slot * 0x14;
    int id = ((Slot *)(data_ov002_022cf16c + off + 0x30 + pos))->id;
    if (slot < 5) {
        if (func_ov002_021b8fcc(side, slot) == 0) return 0;
    }
    if (id == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + pos) == 0) return 0;
    if (func_0202b878(id) != 0x17) return 0;
    if ((*(unsigned int *)(data_ov002_022cf1ac + off + pos) >> 9) & 1) return 0;
    if (func_ov002_021c1ef0(card, side, slot) == 0) return 0;
    return func_ov002_021c2084(card, side, slot, 1) != 0;
}

