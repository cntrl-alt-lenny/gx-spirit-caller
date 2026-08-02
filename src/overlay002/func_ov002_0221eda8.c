typedef unsigned short u16;

struct Self0221eda8 {
    u16 f0;
    u16 b0 : 1;
    u16 idx5 : 5;
    u16 rest1 : 10;
    u16 pad4 : 6;
    u16 f4_9bit : 9;
    u16 rest2 : 1;
};

struct RowSlot {
    unsigned int pad0 : 13;
    unsigned int slotLo : 1;
    unsigned int pad1 : 8;
    unsigned int slotHi : 8;
    unsigned int pad2 : 2;
};

extern char data_ov002_022cf16c[];
extern u16 data_ov002_022cf1a4[];
extern int func_ov002_02257b48(void *p, void *q);
extern int func_ov002_02210104(void *self, int param2);

int func_ov002_0221eda8(struct Self0221eda8 *self, int param2) {
    int bit0 = self->b0 & 1;
    int idx5 = self->idx5;
    struct RowSlot *slot = (struct RowSlot *)((char *)data_ov002_022cf16c + bit0 * 0x868 + 0x30 + idx5 * 20);
    int combined = slot->slotHi * 2 + slot->slotLo;

    if (self->f4_9bit != combined) {
        return 0;
    }

    {
        u16 v = *(u16 *)((char *)data_ov002_022cf1a4 + bit0 * 0x868 + idx5 * 20);
        if (v == 0) {
            return 0;
        }
    }

    if (func_ov002_02257b48(self, (void *)param2) == 0) {
        return 0;
    }

    return func_ov002_02210104(self, param2);
}
