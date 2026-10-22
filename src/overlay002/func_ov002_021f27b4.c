typedef struct { unsigned short id; unsigned short side:1; unsigned short rest:15; } Card;
typedef struct { unsigned int id:13; unsigned int rest:19; } Slot;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1ac[];
extern int data_ov002_022cd3f4[];
extern int func_ov002_021c1ef0(Card *card, int side, int slot);
/* Original caller supplies only r0-r1 to this four-parameter thunk. */
extern int func_ov002_021c8940();
/* Original caller supplies only r0-r1 to this four-parameter thunk. */
extern int func_ov002_021c84e0();
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021bd6c8(int a);
extern int func_ov002_021ba104(int a, int b, int c);
extern int func_ov002_021b90a8(int arg0, int arg1);
int func_ov002_021f27b4(Card *card, int side, int slot) {
    unsigned int pos;
    unsigned int off;
    pos = slot * 0x14;
    off = (side & 1) * 0x868;
    int id = ((Slot *)(data_ov002_022cf16c + off + 0x30 + pos))->id;
    if (side != card->side) return 0;
    if (slot >= 5) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + pos) == 0) return 0;
    if (id == 0) return 0;
    if (func_ov002_021c1ef0(card, side, slot) == 0) return 0;
    switch (card->id) {
    case 0x157a:
        if (func_ov002_021c8940(side, slot) == 7) {
            if (func_ov002_021c8470(side, slot) <= 500) return 1;
        }
        return 0;
    case 0x1669:
        {
            unsigned int status = *(unsigned short *)(data_ov002_022cf1a4 + off + pos);
            unsigned int flags = *(unsigned int *)(data_ov002_022cf1ac + off + pos);
            if (status & ~((flags >> 6) & 1) & ~(((flags >> 1) | (flags >> 2)) & 1)) {
                switch (func_ov002_021b9ecc(side, slot)) {
                case 0x13cd:
                    if (func_ov002_021bd6c8(0x10f4) != 0) return 0;
                    break;
                case 0x164e: return 0;
                }
            }
        }
        return 1;
    case 0x1908:
        if (*(unsigned short *)(data_ov002_022cf1a2 + off + pos) != 0) return 0;
        return func_ov002_021ba104(side, slot, 0x18f9);
    case 0x1978:
        if (func_ov002_021b90a8(side, slot) != 0) return func_ov002_021c84e0(side, slot) <= 2;
        return 0;
    case 0x1402:
        if (func_ov002_021b9ecc(side, slot) != 0x13c7) return 0;
        if (data_ov002_022cd3f4[1] == side && data_ov002_022cd3f4[8] == slot) return 0;
        return 1;
    case 0x143b:
        if (func_ov002_021b9ecc(side, slot) != 0x1439) return 0;
        if (data_ov002_022cd3f4[1] == side && data_ov002_022cd3f4[8] == slot) return 0;
        return 1;
    case 0x1aa6:
        if (func_ov002_021c8940(side, slot) != 9) return 0;
        return func_ov002_021c84e0(side, slot) >= 5;
    }
    return 1;
}









