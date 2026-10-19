typedef unsigned int u32;
typedef unsigned short u16;
struct Self { u16 id; u16 side:1; u16 index:5; u16 rest:10; };
struct Pair { int side; int index; int unk8; int value; char pad[0x28]; };
struct Slot { u32 id:13; u32 bit:1; u32 gap:8; u32 value:8; u32 rest:2; char pad[16]; };
extern unsigned char data_ov002_022d016c[];
extern struct Pair data_ov002_022cd420[];
extern int data_ov002_022cd3f4[];
struct Table { char pad[0x30]; struct Slot slots[105]; char tail[4]; }; extern struct Table data_ov002_022cf16c[];
extern int func_ov002_021b3618(int player, int idx);
extern int func_ov002_021de64c(int a, int b, int c, int unused3);
int func_ov002_0223ab58(struct Self *self) {
    int side = *(int *)(data_ov002_022d016c + 0xcec);
    struct Pair *a = &data_ov002_022cd420[side];
    struct Pair *b = &data_ov002_022cd420[1-side];
    int id = func_ov002_021b3618(self->side, self->index);
    if (data_ov002_022cd3f4[2] != 0) return 0;
    if (id != (u16)((unsigned char)a->side | ((unsigned char)a->index << 8))) {
        struct Slot *slot = &data_ov002_022cf16c[a->side & 1].slots[a->index];
        if (a->value == slot->value*2 + slot->bit)
            func_ov002_021de64c((int)self, a->side, a->index, 0);
    }
    if (id != (u16)((unsigned char)b->side | ((unsigned char)b->index << 8))) {
        struct Slot *slot = &data_ov002_022cf16c[b->side & 1].slots[b->index];
        if (b->value == slot->value*2 + slot->bit)
            func_ov002_021de64c((int)self, b->side, b->index, 0);
    }
    return 0;
}

