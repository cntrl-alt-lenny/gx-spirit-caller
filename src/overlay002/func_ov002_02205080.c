typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 id; u16 side:1; u16 pad:5; u16 kind:6; u16 mode:2; u16 rest:2; u32 reserved[4]; u32 field14; } Obj;
typedef struct { int pad; int side; int busy; int reserved[5]; int slot; } State;
typedef struct { char pad[0x30]; u32 id:13; u32 rest:19; } Card;
typedef struct { char bytes[0x14]; } Slot;
extern State data_ov002_022cd3f4;
typedef struct { u32 id:13; u32 rest:19; char tail[16]; } Entry;
typedef struct { char pre[0x30]; Entry slots[5]; char tail[0x7d4]; } Table;
extern Table data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_0202e310(int unused0);
extern int func_ov002_021b359c(int self, int arg1);
extern int func_ov002_021c84e0();
int func_ov002_02205080(Obj *self, Obj *other) {
    int side, slot;
    char *entry;
    unsigned int sideOffset, slotOffset;
    if (other != 0 && other->id == self->id) return 0;
    if (self->kind == 0x12 && self->field14 != 0) {
        side = data_ov002_022cd3f4.side;
        slot = data_ov002_022cd3f4.slot;
        if (side == self->side && data_ov002_022cd3f4.busy == 0) {
            slotOffset = slot * 0x14;
            sideOffset = (side & 1) * 0x868;
            entry = (char *)data_ov002_022cf16c + sideOffset;
            entry += slotOffset;
            if (func_0202e310(data_ov002_022cf16c[side & 1].slots[slot].id) != 0 &&
                *(u16 *)(data_ov002_022cf1a4 + sideOffset + slotOffset) != 0 &&
                func_ov002_021c84e0(side, slot) <= 4 &&
                func_ov002_021b359c(side, 0x1318) == 0) return 2;
        }
    }
    return self->mode == 0;
}














