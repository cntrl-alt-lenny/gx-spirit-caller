typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 side:1; u16 slot:4; u16 card:9; u16 kind:2; } Entry;
struct Self { char pad[4]; struct { u16 pad:6; u16 field:9; u16 rest:1; } f4; union { u16 raw; struct { u16 low:8; u16 count:8; } b; } f6; Entry entries[1]; };
struct Card { u32 pad:13; u32 flag:1; u32 pad2:8; u32 number:8; u32 pad3:2; char rest[16]; };
struct Table { char pad[0x30]; struct Card cards[100]; char rest[104]; };
extern struct Table data_ov002_022cf16c[];
struct Flag { u16 value; char rest[18]; }; struct Flags { struct Flag flags[100]; char rest[152]; }; extern struct Flags data_ov002_022cf1a4[];
extern char data_ov002_022ce288[];
extern void func_ov002_0223db04(struct Self *self, unsigned int side, unsigned int slot);
extern void func_ov002_021d86fc(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021b9ecc(int side, int slot);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
void func_ov002_0223dcc0(struct Self *self, int side, int slot) {
    unsigned int index = self->f6.b.low;
    int card;
    if (index < 5) {
        func_ov002_0223db04(self, side, slot);
    } else if (index == 5) {
        *(u16 *)((char *)self + index * 2 + 8) = *(int *)(data_ov002_022ce288 + 0x494);
    }
    func_ov002_021d86fc(side, slot, data_ov002_022cf16c[side & 1].cards[slot].number * 2 + data_ov002_022cf16c[side & 1].cards[slot].flag, self->f6.b.low);
    self->f6.raw = (self->f6.raw & ~0xff) | (((u16)(self->f6.b.low + 1)) & 0xff);
    if (data_ov002_022cf1a4[side & 1].flags[slot].value == 0) return;
    if (slot > 4) return;
    card = func_ov002_021b9ecc(side, slot);
    if (card != 0x1596 && card != 0x1598) return;
    func_ov002_021d59cc(side, slot, 0x1596, 2, self->f4.field);
}

