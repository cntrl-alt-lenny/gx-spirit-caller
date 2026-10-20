typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;
    unsigned short field : 5;
    unsigned short : 10;
} Card021c1e44;
struct Slot { unsigned int id : 13; char pad[16]; };
struct Board { char pad[0x30]; struct Slot slots[5]; char tail[0x7d4]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022d016c[];
extern int func_ov002_021c1e44(Card021c1e44 *, int, int);
/* This caller supplies only two arguments to the four-argument thunk. */
extern int func_ov002_021c84e0();
extern int func_ov002_021b9000(int, int);
extern int func_ov002_021b9ecc(int, int);
extern int func_0202eac8(int);
int func_ov002_021e9e58(Card021c1e44 *self, int player, int idx) {
    int slot;
    int side;

    if (idx >= 5) return 0;
    slot = idx * 20;
    side = (player & 1) * 0x868;
    if (((struct Board *)data_ov002_022cf16c)[player & 1].slots[idx].id == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + side + slot) == 0) return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0) return 0;
    switch (self->f0) {
    case 0x12cb:
    case 0x16e1:
        return 1;
    case 0x15df:
        return *(unsigned short *)((char *)self + 0xc) == func_ov002_021c84e0(player, idx);
    case 0x17b6:
        return player == *(int *)(data_ov002_022d016c + 0xcec);
    case 0x17b3:
        if (*(unsigned short *)(data_ov002_022cf1a2 + side + slot) != 0) return 0;
        return func_ov002_021b9000(player, idx);
    case 0x1840:
        return func_ov002_021b9ecc(player, idx) == 0xfe5;
    case 0x1988:
        if (func_0202eac8(func_ov002_021b9ecc(player, idx)) && func_ov002_021b9ecc(player, idx) != 0x18a7) return 1;
        return 0;
    }
    return 0;
}















