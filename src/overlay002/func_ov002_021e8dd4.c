struct Slot { unsigned int id:13; unsigned int flag:1; unsigned int pad:8; unsigned int tag:8; unsigned int rest:2; char tail[16]; };
struct Row { char pad[0x30]; struct Slot slots[11]; };
typedef struct { unsigned short id; unsigned short side:1; unsigned short field:5; unsigned short rest:10; unsigned short pad:6; unsigned short tag:9; unsigned short rest2:1; } Card;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
struct TableEntry { unsigned short id:13; unsigned short rest:3; unsigned short extra; };
extern struct TableEntry data_ov002_022d0250[];
extern int func_ov002_021c1ef0(Card *, int, int);
extern int func_ov002_021c2084(Card *, int, int, int);
extern int func_ov002_021c1e44(Card *, int, int);
/* Original supplies only r0-r1 to the four-parameter thunk. */
extern int func_ov002_021c8940();
extern int func_ov002_021c8470(int, int);
extern int func_ov002_021c84a8(int, int);
extern int func_0202b8f0(int);
extern int func_0202e2c8(int);
/* This original caller also supplies the unused card id in r0. */
extern int func_0202e2e0(int unused0);
int func_ov002_021e8dd4(Card *self, int player, int idx) {
    int id;
    int row = (player & 1) * 0x868;
    int pos = idx * 20;
    id = ((struct Row *)(data_ov002_022cf16c + row))->slots[idx].id;
    if (idx >= 5) return 0;
    if (id == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + row + pos) == 0) return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0) return 0;
    if (func_ov002_021c2084(self, player, idx, 0) == 0) return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0) return 0;
    switch (self->id) {
    case 0x119a: return func_ov002_021c8940(player, idx) == 1;
    case 0x14c5: {
        int side = self->side;
        int slot = self->field;
        int tag = self->tag;
        struct Slot *s = &((struct Row *)(data_ov002_022cf16c + (side & 1) * 0x868))->slots[slot];
        int value;
        if (tag != s->tag * 2 + s->flag) value = func_0202b8f0(data_ov002_022d0250[tag].id);
        else value = func_ov002_021c8470(side, slot);
        return func_ov002_021c84a8(player, idx) <= value;
    }
    case 0x1b63: return func_0202e2c8(id);
    case 0x1b64: return func_0202e2e0(id);
    }
    return 1;
}



