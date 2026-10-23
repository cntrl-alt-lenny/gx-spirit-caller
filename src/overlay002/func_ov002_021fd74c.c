typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 id; u16 side:1, zone:5, tag:6, mode:2, flip:1, rest:1; u16 low:6, index:9, high:1; u16 pad; u32 a, b, c, value; } Card;
typedef struct { u32 id:13, flag:1, pad:8, type:8, rest:2; } Packed;
typedef struct { char pad[0x120]; Packed cards[466]; } Player;
extern Player data_ov002_022cf16c[];
extern int func_ov002_021fc3e8(Card *self, Card *other);
int func_ov002_021fd74c(int side, int slot, u16 id) {
    Card card = {0};
    Packed *flags;
    u16 index;
    Player *player = &data_ov002_022cf16c[side & 1];
    card.id = id;
    card.side = (u16)side;
    card.zone = 11;
    flags = &player->cards[slot];
    index = flags->type * 2 + flags->flag;
    card.index = index;
    card.tag = 0;
    return func_ov002_021fc3e8(&card, 0);
}

