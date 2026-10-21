typedef struct {
    unsigned short id;
    unsigned short side:1;
    unsigned short kind:5;
    unsigned short rest:10;
} Card;
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int func_0202e234(int x);
extern int func_0202ed90(int a0);
/* Existing C says void, but this original caller consumes the integer result in r0. */
extern int func_ov002_021b314c(int arg0, int arg1, int arg2);
extern int func_ov002_021b3618(int player, int idx);
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_021b59b0(Card *card);
extern int func_ov002_021b8fcc(int a0, int a1);
extern int func_ov002_021b9ecc(int player, int idx);
extern int func_ov002_021bb5a8(int player, int want);
int func_ov002_021c2084(Card *card, int side, int slot, int check)
{
    int id;
    int valid = 1;
    int off, pos;
    int inRange = 0;
    if (card->kind >= 5 && card->kind <= 10) inRange = 1;
    if (inRange == 0) {
        if (func_0202e234(card->id) != 0) valid = 0;
    }
    if (card->id == 0) return 1;
    off = (side & 1) * 0x868;
    pos = slot * 0x14;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + pos) != 0) {
        id = func_ov002_021b9ecc(side, slot);
        switch (id) {
        case 0x150c:
            if (!((*(unsigned int *)(data_ov002_022cf1ac + off + pos) >> 6) & 1)) {
                if (slot >= 5) {
                    if (func_ov002_021b3618(side, slot) != 0xffff) return 0;
                }
            }
            break;
        case 0x1645:
            if (!((*(unsigned int *)(data_ov002_022cf1ac + off + pos) >> 6) & 1)) {
                if (slot <= 4 && valid != 0) return 0;
            }
            break;
        }
        if (func_ov002_021b3ecc(side, slot, 0x1a5c) != 0) return 0;
        if (check != 0 && slot <= 4) {
            if (func_ov002_021b314c(side, slot, 0x150a) != 0) {
                int flags = func_ov002_021b59b0(card);
                if (func_ov002_021b8fcc(side, slot) == 0 || flags == 0 || (flags & 2)) return 0;
            }
        }
        if (func_0202ed90(id) != 0) {
            if (func_ov002_021bb5a8(side, 0x1a05) != 0) return 0;
        }
    } else {
        if (slot >= 5) {
            if (func_ov002_021b3ecc(0, 11, 0x153c) != 0) return 0;
        }
    }
    return 1;
}






