typedef struct {
    unsigned short id;
    unsigned short side:1;
    unsigned short kind:5;
    unsigned short rest:10;
    unsigned short flags:6;
    unsigned short link:9;
    unsigned short extra:1;
} Card;
struct Slot {
    unsigned int id:13;
    unsigned int side:1;
    unsigned int flags:8;
    unsigned int link:8;
    unsigned int extra:2;
    char padding[16];
};
struct Player { char header[0x30]; struct Slot slots[100]; char tail[104]; };
extern struct Player data_ov002_022cf16c[];
extern int func_ov002_021b8fcc(int a0, int a1);
extern int func_ov002_021c2084(Card *card, int side, int slot, int check);
int func_ov002_021eb704(Card *card, int player, int idx)
{
    if (idx < 5) {
        if (func_ov002_021b8fcc(player, idx) == 0) return 0;
    }
    if (data_ov002_022cf16c[player & 1].slots[idx].id == 0) return 0;
    if (data_ov002_022cf16c[player & 1].slots[idx].link * 2 + data_ov002_022cf16c[player & 1].slots[idx].side == card->link) return 0;
    return func_ov002_021c2084(card, player, idx, 0) != 0;
}
