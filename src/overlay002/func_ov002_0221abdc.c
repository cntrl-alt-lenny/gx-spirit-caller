typedef unsigned short u16;
typedef unsigned char u8;
typedef unsigned int u32;
struct Ov002Self {
    u16 id;
    u16 side:1;
    u16 index:5;
    u16 kind:6;
    u16 pad2:4;
    u16 pad4:2;
    u16 flag:1;
    u16 pad4b:3;
    u16 value:9;
    u16 pad4c:1;
};
struct Slot { u32 lo:13; u32 bit:1; u32 pad:8; u32 hi:8; u32 tail:2; };
extern int data_ov002_022cd3f4[];
extern char data_ov002_022cf16c[];
extern int func_ov002_021b34f4(int row_sel, int col_idx, int lo_want, int hi_want);
extern int func_ov002_021d5a08(struct Ov002Self *arg0, int arg1, int arg2, int arg3, u16 arg4, u16 arg5);
int func_ov002_0221abdc(struct Ov002Self *self) {
    int row = data_ov002_022cd3f4[0];
    int col = data_ov002_022cd3f4[7];
    struct Slot *slot;
    if (self->flag) return 0;
    slot = (struct Slot *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x30 + self->index * 20);
    if (self->value != slot->bit + (slot->hi << 1)) return 0;
    if ((u16)(self->kind + 0xffee) <= 2 && row != self->side && !func_ov002_021b34f4(row, col, self->side, self->index)) {
        func_ov002_021d5a08(self, row, col, (u16)((u8)self->side | ((u8)self->index << 8)), 7, 0);
    }
    return 0;
}


