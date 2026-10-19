typedef struct {
    unsigned short id;
    unsigned short side : 1;
    unsigned short slot : 5;
    unsigned short rest2 : 10;
    unsigned short rest4 : 6;
    unsigned short value : 9;
    unsigned short rest5 : 1;
} Card;
typedef struct {
    unsigned int pad0 : 13;
    unsigned int low : 1;
    unsigned int pad1 : 8;
    unsigned int high : 8;
    unsigned int pad2 : 2;
} Slot;
extern char data_ov002_022cf16c[];
extern unsigned int func_0202b8c0(int id);
extern int func_0202e234(int x);
int func_ov002_0228af60(Card *self, Card *arg) {
    if (arg == 0) return 0;
    if (arg->side == self->side && arg->slot >= 5 && arg->slot < 10) {
        Slot *s = (Slot *)(data_ov002_022cf16c + (arg->side & 1) * 0x868 + 0x30 + arg->slot * 0x14);
        if (s->high * 2 + s->low == arg->value &&
            func_0202e234(arg->id) == 0 &&
            func_0202b8c0(arg->id) != 3 &&
            func_0202b8c0(arg->id) != 4) {
            switch (arg->id) {
            case 0x1102: case 0x1231: case 0x1238:
            case 0x1400: case 0x1514: case 0x159c:
                return 0;
            default: return 1;
            }
        }
    }
    return 0;
}
