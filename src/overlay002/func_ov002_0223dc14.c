typedef unsigned short u16;
typedef struct { u16 side:1; u16 slot:4; u16 card:9; u16 kind:2; } Entry;
struct Self { char pad[6]; u16 low:8; u16 count:8; Entry entries[1]; };
void func_ov002_0223dc14(struct Self *self, unsigned int side, unsigned int slot, unsigned int card) {
    Entry entry;
    entry.side = (u16)side;
    entry.slot = (u16)slot;
    entry.card = (u16)card;
    entry.kind = 0;
    {
        unsigned int index = self->count;
        self->count = (u16)(self->count + 1);
        self->entries[index] = entry;
    }
}
