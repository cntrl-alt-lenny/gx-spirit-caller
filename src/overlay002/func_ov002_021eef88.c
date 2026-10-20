typedef unsigned short u16;
struct Self { u16 f0; u16 f2; u16 low:6; u16 value:9; u16 high:1; };
struct Slot { unsigned int id:13; unsigned int bit13:1; unsigned int pad:8; unsigned int value:8; unsigned int high:2; };
struct Entry { struct Slot slot; char pad[16]; };
struct Row { char pad[0x30]; struct Entry entries[11]; char tail[0x75c]; };
extern struct Row data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
int func_ov002_021eef88(struct Self *self, int player, int idx) {
    int poff;
    int ioff;
    struct Row *row;
    if (idx > 4) return 0;
    ioff = idx * 0x14;
    player &= 1;
    poff = player * 0x868;
    row = &data_ov002_022cf16c[player];
    if (row->entries[idx].slot.id == 0) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + poff + ioff) == 0) return 0;
    {
        struct Slot *slot = (struct Slot *)((char *)row + 0x30 + ioff);
        return self->value != slot->value * 2 + slot->bit13;
    }
}





