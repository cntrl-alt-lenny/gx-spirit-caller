typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 side:1; u16 slot:4; u16 card:9; u16 kind:2; } Entry;
struct Self { char pad[6]; u16 low:8; u16 count:8; Entry entries[1]; };
struct Card { u32 pad:13; u32 flag:1; u32 pad2:8; u32 number:8; u32 pad3:2; char rest[16]; };
struct Table { char pad[0x30]; struct Card cards[100]; char rest[104]; };
extern struct Table data_ov002_022cf16c[];
struct Info { u16 pad:13; u16 kind:2; u16 pad2:1; u16 other; };
extern struct Info data_ov002_022d0250[];
void func_ov002_0223db04(struct Self *self, unsigned int side, unsigned int slot) {
    Entry entry;
    struct Table *table = &data_ov002_022cf16c[side & 1];

    entry.side = (u16)side;
    entry.slot = (u16)slot;
    entry.card = (u16)(table->cards[slot].number * 2 + table->cards[slot].flag);
    entry.kind = data_ov002_022d0250[entry.card].kind;
    {
        unsigned int index = self->count;
        self->count = (u16)(self->count + 1);
        self->entries[index] = entry;
    }
}





