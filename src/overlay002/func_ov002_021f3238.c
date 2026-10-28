typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;
    unsigned short field : 5;
    unsigned short : 10;
} Card021c1e44;
typedef Card021c1e44 Card;
struct Slot { unsigned int id : 13; char pad[0x10]; };
struct Player { char pad[0x30]; struct Slot slots[5]; char tail[0x7d4]; };
extern struct Player data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a2[];
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern int func_ov002_021c2084(Card *card, int side, int slot, int check);
extern int func_ov002_021b90a8(int arg0, int arg1);
int func_ov002_021f3238(Card *card, int player, int idx)
{
    int poff, ioff;


    if (idx >= 5) return 0;
    poff = (player & 1) * 0x868;

    ioff = idx * 0x14;

    if (((struct Player *)((char *)data_ov002_022cf16c + poff))->slots[idx].id == 0) return 0;
    if (func_ov002_021c1e44(card, player, idx) != 0) return 0;
    if (func_ov002_021c2084(card, player, idx, 0) != 0) {
        if (*(unsigned short *)(data_ov002_022cf1a4 + poff + ioff) == 0 ||
            *(unsigned short *)(data_ov002_022cf1a2 + poff + ioff) != 0 ||
            func_ov002_021b90a8(player, idx) == 0) return 1;
        return 0;
    }
    return 0;
}












