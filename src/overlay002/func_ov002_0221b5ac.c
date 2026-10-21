typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    u16 f0;
    u16 side : 1;
    u16 idx : 5;
    u16 pad2 : 10;
    u16 pad4 : 6;
    u16 want : 9;
    u16 pad4b : 1;
} Obj;
typedef struct {
    u32 lo : 13;
    u32 b : 1;
    u32 mid : 8;
    u32 a : 8;
    u32 hi : 2;
} Slot;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
int func_ov002_0221b5ac(Obj *self) {
    int side = self->side;
    int off = (side & 1) * 0x868;
    int idx = self->idx;
    Slot *slot = (Slot *)(data_ov002_022cf16c + off + 0x30 + idx * 0x14);
    if (self->want != slot->a * 2 + slot->b) {
        return 0;
    }
    if (*(u16 *)(data_ov002_022cf1a4 + off + idx * 0x14) != 0) {
        func_ov002_021d59cc(side, idx, self->f0, 4, 1);
    }
    return 0;
}
