typedef struct { unsigned short id; unsigned short side:1; unsigned short kind:5; unsigned short rest:10; unsigned short pad:6; unsigned short tag:9; unsigned short rest2:1; } Card;
struct Slot { unsigned int id:13; unsigned int flag:1; unsigned int pad:8; unsigned int tag:8; unsigned int rest:2; char tail[16]; };
struct Row { char pad[0x30]; struct Slot slots[11]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c2084(Card *card, int side, int slot, int check);
extern int func_ov002_021c1ef0(Card *card, int side, int slot);
extern int func_ov002_021c8470(int a, int b);
int func_ov002_021e8bc4(Card *self, int player, int idx) {
    int pos, row;
    if (idx > 4) return 0;
    pos = idx * 20;
    row = (player & 1) * 0x868;
    if (((struct Row *)(data_ov002_022cf16c + row))->slots[idx].id == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + row + pos) == 0) return 0;
    if (((struct Row *)(data_ov002_022cf16c + row))->slots[idx].tag * 2 + ((struct Row *)(data_ov002_022cf16c + row))->slots[idx].flag == self->tag) return 0;
    if (func_ov002_021c2084(self, player, idx, 1) == 0) return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0) return 0;
    return func_ov002_021c8470(player, idx) <= 1000;
}


