typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 id; u16 side:1, zone:5, tag:6, mode:2, flip:1, rest:1; u16 pad:6, index:9, last:1; u16 extra[7]; u32 value; } Card;
struct Entry { unsigned id:13; unsigned rest:19; };
struct Player { char pad[0xc]; unsigned count; char gap[0x110]; struct Entry cards[32]; char tail[0x6c8]; };
extern struct Player data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_ov002_021b9ecc(int player, int slot);
extern int func_ov002_021fbf74(int player, int side, int slot, Card *other);
extern int func_ov002_021fc0c8(int player, int index, Card *other);
extern int func_ov002_022451b8(int side, int card);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
int func_ov002_02245dd4(void *self, int flag) {
    int player = (int)self;
    int side, slot, id;
    struct Entry *card;
    struct Player *p;
    unsigned i;
    for (side = 0; side < 2; side++) {
        for (slot = 0; slot <= 10; slot++) {
            id = func_ov002_021b9ecc(side, slot);
            if (id && func_ov002_021fbf74(player, side, slot, 0)) {
                if (!flag || func_ov002_022451b8(player, id)) return 1;
            }
        }
    }
    i = 0;
    if (i < *(unsigned *)(data_ov002_022cf178 + (player & 1) * 0x868)) {
        p = &data_ov002_022cf16c[player & 1];
        card = p->cards;
        do {
            id = card->id;
            if (func_ov002_021fc0c8(player, i, 0)) {
                if (!flag || func_ov002_022451b8(player, id)) return 1;
            }
            i++;
            card++;
        } while (i < p->count);
    }
    return func_ov002_022536e8(self, 0xfffe, 14) != 0;
}
