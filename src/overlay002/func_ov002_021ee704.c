typedef unsigned short u16;
struct Self { u16 f0; u16 b0:1; u16 pad:15; u16 low:6; u16 value:9; u16 high:1; };
struct Slot { unsigned int id:13; unsigned int bit13:1; unsigned int pad:8; unsigned int value:8; unsigned int high:2; };
struct Entry { struct Slot slot; char pad[16]; };
struct Row { char pad[0x30]; struct Entry entries[11]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern unsigned int func_0202b878(int id);
extern int func_ov002_021c1ef0(struct Self *self, int player, int idx);
int func_ov002_021ee704(struct Self *self, int player, int idx) {
    int ioff = idx * 0x14;
    int poff = (player & 1) * 0x868;
    struct Row *row = (struct Row *)((unsigned int)data_ov002_022cf16c + poff);
    unsigned int id = row->entries[idx].slot.id;
    if (id == 0) return 0;
    if (player != self->b0) return 0;
    if (idx < 5 || idx > 10) return 0;
    if ((*(unsigned int *)(data_ov002_022cf1ac + poff + ioff) >> 9 & 1) == 0) {
        if (func_0202b878(id) == 23) return 0;
    }
    if (*(u16 *)(data_ov002_022cf1a4 + poff + ioff) == 0) return 0;
    {
        struct Slot *slot = (struct Slot *)(data_ov002_022cf16c + poff + 0x30 + ioff);
        if (slot->value * 2 + slot->bit13 == self->value) return 0;
    }
    return func_ov002_021c1ef0(self, player, idx) != 0;
}











