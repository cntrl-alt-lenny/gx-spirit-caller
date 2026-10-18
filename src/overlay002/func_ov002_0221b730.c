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
extern int data_ov002_022d016c[];
extern int func_ov002_021d59cc(int side, int idx, u16 f0, u16 flags, int zero);

int func_ov002_0221b730(Obj *self) {
    int side = self->side;
    int off = (side & 1) * 0x868;
    int idx = self->idx * 0x14;
    char *tab = data_ov002_022cf16c + off + 0x30;
    Slot *slot = (Slot *)(tab + idx);

    if (self->want != slot->b + (slot->a << 1)) {
        return 0;
    }
    if (*(u16 *)(data_ov002_022cf1a4 + off + idx) != 0) {
        func_ov002_021d59cc(side, self->idx, self->f0,
                            (((unsigned char)((data_ov002_022d016c[0xcec / 4] == side) + 1) << 4) | 2), 0);
    }
    return 0;
}
