typedef unsigned short u16;
typedef unsigned char u8;
struct Slot { u16 side:1; u16 kind:4; u16 number:9; u16 state:2; };
struct Node { char pad[6]; struct { u16 lo:8; u16 hi:8; } count; struct Slot slots[5]; u16 start; };
struct Row { unsigned id:13; unsigned bit13:1; unsigned pad:8; unsigned field:8; unsigned rest:2; char tail[16]; };
struct SideRow { char prefix[48]; struct Row row; };
struct Entry { u16 id:13; u16 state:2; u16 rest:1; u16 other; };
extern struct Slot data_ov002_022ce720[];
extern char data_ov002_022cf16c[];
extern struct Entry data_ov002_022d0250[];
int func_ov002_0223df38(struct Node *self, int idx, int *out) {
    struct Slot *p;
    int count;
    unsigned kind;
    unsigned side;
    unsigned offset;
    unsigned base;
    struct Row *row;
    unsigned number;
    if (idx < 5) p = &self->slots[idx];
    else p = &data_ov002_022ce720[(self->start + idx - 5) % 128];
    if (out != 0) *out = (u16)((u8)p->side | ((u8)p->kind << 8));
    count = self->count.hi > self->count.lo ? self->count.hi : self->count.lo;
    if (idx >= count) return 0;
    kind = p->kind;
    if (kind > 10) return 0;
    side = p->side;
    offset = (side & 1) * 0x868;
    base = offset + (unsigned)data_ov002_022cf16c;
    if (((struct SideRow *)(base + kind * 20))->row.id == 0) return 0;
    row = (struct Row *)(base + 0x30);
    number = p->number;
    if (number != row[kind].field * 2 + row[kind].bit13) return 0;
    return p->state == data_ov002_022d0250[number].state;
}








