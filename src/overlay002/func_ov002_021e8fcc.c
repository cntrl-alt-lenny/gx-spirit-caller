struct Slot { unsigned int id:13; unsigned int flag:1; unsigned int pad:8; unsigned int tag:8; unsigned int rest:2; char tail[16]; };
struct Row { char pad[0x30]; struct Slot slots[11]; };
typedef struct { unsigned short id; unsigned short side:1; unsigned short field:5; unsigned short rest:10; unsigned short pad:1; unsigned short pad2:5; unsigned short tag:9; unsigned short rest2:1; unsigned short extra[3]; unsigned short count; } Card;
extern char data_ov002_022cf16c[], data_ov002_022cf1a4[], data_ov002_022cf1ac[];
extern int func_ov002_021c1ef0(Card *, int, int);
extern int func_ov002_021c1e44(Card *, int, int);
/* Original caller supplies only two arguments to the four-parameter thunk. */
extern int func_ov002_021c8940();
extern int func_ov002_021c84a8(int, int);
extern int func_ov002_021b39c4(int, int, int);
extern int func_ov002_021b9ecc(int, int);
extern int func_0202e42c(int);
extern int func_ov002_021c8470(int, int);
extern int func_ov002_021c848c(int, int);
extern int func_ov002_021ba104(int, int, int);
extern void func_ov002_021c4c9c(int, int, int *);
extern int func_ov002_021c93cc(int, int, int);
extern int func_0202e270(int);
extern int func_ov002_021bc618(int);
extern int func_0202eab0(int);
extern int func_ov002_022536e8(void *, int, int);
int func_ov002_021e8fcc(Card *self, int player, int idx) {
    int id;
    int pos = idx * 20;
    int row = (player & 1) * 0x868;
    int kind;
    id = ((struct Row *)(data_ov002_022cf16c + row))->slots[idx].id;
    if (idx >= 5) return 0;
    if (id == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + row + pos) == 0) return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0) return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0) return 0;
    kind = func_ov002_021c8940(player, idx);
    switch (self->id) {
    case 0x14b9:
        if (((struct Row *)(data_ov002_022cf16c + row))->slots[idx].tag * 2 + ((struct Row *)(data_ov002_022cf16c + row))->slots[idx].flag == self->tag) return 0;
        return kind == 3;
    case 0x14d3: return kind == 15 || kind == 18;
    case 0x14e0: return func_ov002_021c84a8(player, idx) <= 800;
    case 0x15e4: {
        int result = 0;
        unsigned int flags = *(unsigned int *)(data_ov002_022cf1ac + row + pos);
        if (((flags >> 22) & 1) + ((flags >> 23) & 1)) {
            if (func_ov002_021b39c4(player, idx, 0) != 0xffff) result = 1;
        }
        return result;
    }
    case 0x1690: return func_0202e42c(func_ov002_021b9ecc(player, idx));
    case 0x16c0: {
        int slot = self->field;
        int side = self->side;
        int row2 = (side & 1) * 0x868;
        int pos2 = slot * 20;
        int tag = self->tag;
        struct Slot *s = &((struct Row *)(data_ov002_022cf16c + row2))->slots[slot];
        int value;
        if (s->tag * 2 + s->flag != tag) break;
        if (*(unsigned short *)(data_ov002_022cf1a4 + row2 + pos2) == 0) break;
        value = func_ov002_021c8470(player, idx);
        return value > func_ov002_021c8470(side, slot);
    }
    case 0x16ce: return kind == 11 || kind == 12;
    case 0x186a: return func_ov002_021c8470(player, idx) <= self->count * 700;
    case 0x18c9: {
        int slot = self->field;
        int side = self->side;
        int row2 = (side & 1) * 0x868;
        int pos2 = slot * 20;
        int tag = self->tag;
        struct Slot *s = &((struct Row *)(data_ov002_022cf16c + row2))->slots[slot];
        int value;
        if (s->tag * 2 + s->flag != tag) break;
        if (*(unsigned short *)(data_ov002_022cf1a4 + row2 + pos2) == 0) break;
        value = func_ov002_021c848c(player, idx);
        return value < func_ov002_021c8470(side, slot);
    }
    case 0x190e: return func_ov002_021c8470(player, idx) != 2000;
    case 0x1945: return func_ov002_021ba104(player, idx, 0x17ee);
    case 0x19a9: {
        int slot = self->field;
        int side = self->side;
        int row2 = (side & 1) * 0x868;
        int pos2 = slot * 20;
        int tag = self->tag;
        struct Slot *s = &((struct Row *)(data_ov002_022cf16c + row2))->slots[slot];
        int value;
        int buf[11];
        if (s->tag * 2 + s->flag != tag) break;
        if (*(unsigned short *)(data_ov002_022cf1a4 + row2 + pos2) == 0) break;
        value = func_ov002_021c8470(side, slot);
        func_ov002_021c4c9c(player, idx, buf);
        return buf[5] >= value || buf[6] >= value;
    }
    case 0x19f1: return func_ov002_021c93cc(player, idx, 5);
    case 0x1a6d:
        if (((struct Row *)(data_ov002_022cf16c + row))->slots[idx].tag * 2 + ((struct Row *)(data_ov002_022cf16c + row))->slots[idx].flag == self->tag) return 0;
        return func_0202e270(id);
    case 0x1a7c: return func_ov002_021bc618(player) != 0;
    case 0x1afb:
        if (func_0202eab0(id) == 0) return 0;
        if (self->pad == 0) {
            if (func_ov002_022536e8((void *)self->side, self->id, (unsigned short)id | ((unsigned short)((struct Row *)(data_ov002_022cf16c + row))->slots[idx].flag << 16)) == 0) return 0;
        }
        return 1;
    }
    return 0;
}



