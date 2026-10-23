typedef struct { unsigned short id; unsigned short side:1; unsigned short pad:5; unsigned short kind:6; unsigned short rest:4; } Card;
typedef struct { unsigned int id:13; unsigned int rest:19; } Slot;
extern int data_ov002_022cd3f4[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
extern int func_ov002_021c1ef0(Card *card, int side, int slot);
int func_ov002_021ff9c4(Card *card) {
    if ((unsigned short)(card->kind + 0xffee) <= 1) {
        int side = data_ov002_022cd3f4[0];
        int slot = data_ov002_022cd3f4[7];


        if (((Slot *)((data_ov002_022cf16c + (side & 1) * 0x868 + 0x30) + slot * 0x14))->id != 0 &&
            *(unsigned short *)(data_ov002_022cf1a2 + (side & 1) * 0x868 + slot * 0x14) == 0 &&
            func_ov002_021c1ef0(card, side, slot) != 0) {
            if (card->side != side) return 2;
        }
    }
    return 1;
}



