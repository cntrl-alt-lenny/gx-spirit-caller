typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 f0; u16 flag0:1; u16 field:5; u16 rest:10; u16 pad:6; u16 value:9; u16 end:1; } Card021c1e44;
typedef struct { u32 id:13; u32 bit:1; u32 pad:8; u32 sub:8; u32 end:2; char tail[16]; } Slot;
typedef struct { char pad[0x5a8]; int state; int counter; } State;
extern State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022d0e6c[];
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern int func_ov002_021c1a2c(int a, int b, int c);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
extern void func_ov002_021d7100(int a, int b, int c);
extern int func_ov002_02257ab8(int a, int b);
extern void func_ov002_0226b034(int arg0, int arg1, int arg2);
int func_ov002_02231b88(Card021c1e44 *self) {
    int side, off, row;
    Slot *slot;
    switch (data_ov002_022ce288.state) {
    case 0x80: {
        row = self->field * 20;
        side = self->flag0;
        off = (side & 1) * 0x868;
        slot = &((Slot *)(data_ov002_022cf16c + off + 0x30))[self->field];
        if (self->value != slot->sub * 2 + slot->bit) return 0;
        if (*(u16 *)(data_ov002_022cf1a4 + off + row) == 0) return 0;
        if (func_ov002_02257ab8((int)self, 1-side) == 0) return 0;
        func_ov002_0226b034(1-self->flag0, self->f0, self->flag0);
        return 0x7d;
    }
    case 0x7d:
        data_ov002_022ce288.counter = (*(u16 *)(data_ov002_022d0e6c + 0xb0) >> 8) & 0xff;
        return 0x7c;
    case 0x7c:
        if (func_ov002_021c1e44(self, self->flag0, self->field) != 0) return 0;
        if (func_ov002_021c1a2c(self->flag0, self->field, self->f0) == 0) return 0;
        if (func_ov002_021c1e44(self, 1-self->flag0, data_ov002_022ce288.counter) != 0) return 0;
        if (func_ov002_021c1a2c(1-self->flag0, data_ov002_022ce288.counter, self->f0) == 0) return 0;
        func_ov002_021d59cc(self->flag0, self->field, self->f0, 5, (u16)(1-self->flag0));
        func_ov002_021d59cc(1-self->flag0, data_ov002_022ce288.counter, self->f0, 5, self->flag0);
        func_ov002_021d7100(self->flag0,
            (u16)((unsigned char)self->flag0 | ((unsigned char)self->field << 8)),
            (u16)((unsigned char)(1-self->flag0) | ((unsigned char)data_ov002_022ce288.counter << 8)));
        return 0;
    default: return 0;
    }
}













