typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;
    unsigned short field : 5;
    unsigned short : 10;
} Card021c1e44;
struct Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern int data_ov002_022cd3f4[];
extern int func_ov002_021c1ef0(Card021c1e44 *a0, int a1, int a2);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern void func_ov002_021c4c9c(int player, int idx, int *out);
int func_ov002_021ee318(Card021c1e44 *self, int player, int idx) {
    int info[11];
    int value;
    if (idx >= 5) return 0;
    if (((struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 0x14 + 0x30))->id == 0) return 0;
    if (player == self->flag0) return 0;
    if (!((data_ov002_022cd3f4[0] == player && data_ov002_022cd3f4[7] == idx) ||
          (data_ov002_022cd3f4[1] == player && data_ov002_022cd3f4[8] == idx))) return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0) return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0) return 0;
    func_ov002_021c4c9c(player, idx, info);
    value = info[5] > info[6] ? info[5] : info[6];
    if (value / 100 == 0) return 0;
    return 1;
}

