typedef unsigned short u16;
struct Arg { u16 id; u16 side:1; u16 rest:15; };
struct State { char pad[0x5a8]; int mode; unsigned int flags; };
struct Value { char pad[0xd44]; int value; };
struct Index { char pad[0xb0]; u16 index; };
extern struct State data_ov002_022ce288;
extern struct Value data_ov002_022d016c;
extern struct Index data_ov002_022d0e6c;
extern int data_ov002_022cd744[];
extern int func_ov002_021ae680(int arg0, int arg1);
extern int func_ov002_021e104c(int a, int b, int unused, int d);
extern int func_ov002_021e13f4(int a, int b, int c, int unused);
extern void func_ov002_0226b0b0(int arg0, int arg1, int arg2);
extern int func_ov002_0226b258();
int func_ov002_0222c2c8(struct Arg *self) {
    switch (data_ov002_022ce288.mode) {
    case 0x80:
        if (data_ov002_022cd744[self->side] == 1) {
            data_ov002_022d016c.value = 0x60;
        } else {
            func_ov002_021ae680(0x128, 2);
        }
        return 0x7f;
    case 0x7f:
        data_ov002_022ce288.flags = data_ov002_022d016c.value;
        func_ov002_0226b0b0(1-self->side, self->id, data_ov002_022d016c.value);
        return 0x7e;
    case 0x7e:
        func_ov002_0226b258(1-self->side, -1);
        return 0x7d;
    case 0x7d: {
        int index = data_ov002_022d0e6c.index;
        unsigned int flags = data_ov002_022ce288.flags;
        if (flags & (1 << index)) {
            func_ov002_021e104c(self->side, index, 1, flags);
        } else {
            func_ov002_021e13f4(self->side, index, 0, flags);
        }
        return 0;
    }
    default: return 0;
    }
}

