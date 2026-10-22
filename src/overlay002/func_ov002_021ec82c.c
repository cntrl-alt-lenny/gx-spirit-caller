typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;
    unsigned short field : 5;
    unsigned short : 10;
} Card021c1e44;
typedef struct { unsigned int id : 13; unsigned int : 19; } Slot;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c1e44(Card021c1e44 *, int, int);
/* Original calls only set r0-r1; wrapper forwards unused incoming r3. */
extern int func_ov002_021c8940();
/* Original calls only set r0-r1; wrapper forwards unused incoming r3. */
extern int func_ov002_021c84e0();
extern int func_ov002_021b9ecc(int, int);
extern int func_ov002_021b90a8(int, int);
extern int func_ov002_021c93cc(int, int, int);
extern int func_0202e2f8(int);
extern int func_0202ed90(int);
int func_ov002_021ec82c(Card021c1e44 *self, int player, int idx) {
    int side;
    int off;
    char *row;
    if (player != self->flag0) return 0;
    if (idx >= 5) return 0;
    side = (player & 1) * 0x868;
    off = idx * 20;
    row = data_ov002_022cf16c + side + 0x30;
    if (((Slot *)(row + off))->id == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + side + off) == 0) return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0) return 0;
    switch (self->f0) {
    case 0x12cf:
    case 0x153d:
    case 0x15ae:
        return 1;
    case 0x1409:
        return func_ov002_021c8940(player, idx) == 7;
    case 0x14df:
        if (func_ov002_021c8940(player, idx) == 1 &&
            func_ov002_021c84e0(player, idx) >= 5) return 1;
        return 0;
    case 0x143f:
    case 0x16a3:
        switch (func_ov002_021b9ecc(player, idx)) {
        case 0x1532:
        case 0x161e:
        case 0x1656:
        case 0x1685:
        case 0x1686:
            return 1;
        }
        break;
    case 0x17ab:
        if (func_ov002_021b90a8(player, idx) != 0 &&
            func_0202e2f8(((Slot *)(row + off))->id) == 0 &&
            func_ov002_021c84e0(player, idx) == 2) return 1;
        return 0;
    case 0x17ac:
        if (func_ov002_021b90a8(player, idx) != 0 &&
            func_0202e2f8(((Slot *)(row + off))->id) == 0 &&
            func_ov002_021c84e0(player, idx) == 1) return 1;
        return 0;
    case 0x17f9:
        return func_ov002_021c93cc(player, idx, 3);
    case 0x1882:
        return func_ov002_021c8940(player, idx) == 11;
    case 0x18cd:
        switch (func_ov002_021b9ecc(player, idx)) {
        case 0x185a:
        case 0x18b8:
        case 0x18b9:
            return 1;
        }
        break;
    case 0x18d6:
        return func_ov002_021b9ecc(player, idx) == 0x18b7;
    case 0x1a60:
        return func_0202ed90(func_ov002_021b9ecc(player, idx));
    }
    return 0;
}

