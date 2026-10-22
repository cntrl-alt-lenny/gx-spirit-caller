typedef struct { unsigned short id; unsigned short side:1; unsigned short rest:15; } Card;
typedef Card Card021c1e44;
typedef struct { unsigned int id:13; unsigned int rest:19; char tail[16]; } Slot;
typedef struct { char pad[0x30]; Slot slots[11]; } Row;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
extern int func_ov002_021c1ef0(Card *card, int side, int slot);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
int func_ov002_021e8a7c(Card *self, int player, int idx) {
    int row;
    int slot;
    if (idx >= 5) return 0;
    if (player == self->side) return 0;
    row = (player & 1) * 0x868;
    slot = idx * 0x14;
    if (((Row *)(data_ov002_022cf16c + row))->slots[idx].id == 0) return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0) return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0) return 0;
    return *(unsigned short *)(data_ov002_022cf1a2 + row + slot) != 0;
}


