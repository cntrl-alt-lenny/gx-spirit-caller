typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;
    unsigned short field : 5;
    unsigned short : 10;
} Card021c1e44;
typedef struct {
    unsigned int id : 13;
    unsigned int side : 1;
    unsigned int : 18;
} Slot;
extern char data_ov002_022cf16c[];
extern int func_ov002_021c1ef0(Card021c1e44 *, int, int);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern int func_ov002_021b34f4(int row_sel, int col_idx, int lo_want, int hi_want);
int func_ov002_021ecbd0(Card021c1e44 *self, int player, int idx) {
    char *row = data_ov002_022cf16c + (player & 1) * 0x868 + 0x30;
    int off = idx * 20;
    int id = ((Slot *)(row + off))->id;
    if (player != self->flag0) return 0;
    if (idx >= 5) return 0;
    if (id == 0) return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0) return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0) return 0;
    switch (self->f0) {
    case 0x1420:
        if (self->flag0 != ((Slot *)(row + off))->side) return 0;
        break;
    case 0x1957:
        if (func_ov002_021b34f4(player, idx, self->flag0, self->field) != 0) return 0;
        break;
    }
    return 1;
}
