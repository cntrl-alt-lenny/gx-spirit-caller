typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;
    unsigned short field : 5;
    unsigned short : 10;
} Card021c1e44;
struct Slot { unsigned int id:13; unsigned int rest:19; char tail[16]; };
struct Row { char pad[0x30]; struct Slot slots[11]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
int func_ov002_021e8b34(Card021c1e44 *self, int player, int idx) {
    int slot = idx * 20;
    int row = (player & 1) * 0x868;
    if (((struct Row *)(data_ov002_022cf16c + row))->slots[idx].id == 0) return 0;
    if (player == self->flag0) return 0;
    if (idx > 4) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + row + slot) != 0) return 0;
    return func_ov002_021c1e44(self, player, idx) == 0;
}
