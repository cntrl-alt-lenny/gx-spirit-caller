typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 f0; u16 side:1; u16 index:5; u16 rest:10; u16 pad:6; u16 value:9; u16 end:1; char gap[14]; u32 flags; } Self;
typedef struct { u32 id:13; u32 bit:1; u32 pad:8; u32 sub:8; u32 end:2; } Slot;
extern char data_ov002_022d016c[];
typedef struct { char pad[0x5a8]; int state; int counter; } State;
extern State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf178[];
extern void func_ov002_0226aef0(int a, int b, int c, int d);
int func_ov002_02231a3c(Self *self) {
    int side = *(int *)(data_ov002_022d016c + 0xcec) ^ data_ov002_022ce288.counter;
    int active = (unsigned char)(self->flags >> (side * 8)) != 0;
    int off = (self->side & 1) * 0x868;
    int row = self->index * 20;
    Slot *slot = (Slot *)(data_ov002_022cf16c + off + 0x30 + row);
    if (self->value != slot->sub * 2 + slot->bit) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + off + row) == 0) return 0;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        data_ov002_022ce288.counter = 0;
    case 0x7f:
        if (active && *(int *)(data_ov002_022cf178 + (side & 1) * 0x868))
            func_ov002_0226aef0(side, active, 0, 0);
        return 0x7e;
    case 0x7e:
        ++data_ov002_022ce288.counter;
        return data_ov002_022ce288.counter < 2 ? 0x7f : 0;
    default: return 0;
    }
}

