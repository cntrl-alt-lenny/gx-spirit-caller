typedef unsigned short u16;
struct Self {
    u16 id;
    u16 side:1;
    u16 slot:5;
    u16 pad2:10;
    u16 pad4:6;
    u16 number:9;
    u16 pad5:1;
    u16 f6;
};
struct Entry {
    unsigned int pad0:13;
    unsigned int flag:1;
    unsigned int pad1:8;
    unsigned int number:8;
    unsigned int pad2:2;
    char rest[16];
};
struct Group { char pad[0x30]; struct Entry entries[1]; };
extern struct Group data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a8[];
extern int func_ov002_0220e594(struct Self *self);
extern void func_ov002_021d93e0(int a, int b, int c);
int func_ov002_022326fc(struct Self *self) {
    if (func_ov002_0220e594(self) != 0) {
        int side = self->side;
        int slot = self->slot;
        int off = (side & 1) * 0x868;
        struct Entry *e = (struct Entry *)((char *)data_ov002_022cf16c + off + 0x30 + slot * 0x14);
        if (self->number != e->number * 2 + e->flag) return 0;
        if (*(u16 *)(data_ov002_022cf1a4 + off + slot * 0x14) == 0) return 0;
        func_ov002_021d93e0(side, slot, -*(int *)(data_ov002_022cf1a8 + off + slot * 0x14));
    }
    return 0;
}
