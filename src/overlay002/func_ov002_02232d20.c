typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    u16 w0;
    u16 bit0:1;
    u16 pad1:13;
    u16 bit14:1;
    u16 pad15:1;
    u16 pad4[2];
    u16 count;
} S021ff3bc;
struct State { char pad[0x5a8]; int state; int selected; };
struct Buf { char pad[0xd44]; int count; };
extern struct State data_ov002_022ce288;
extern struct Buf data_ov002_022d016c;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern u32 *func_ov002_021b004c(int id);
extern int func_ov002_021c2f24(int a, int b);
extern int func_ov002_021e27c0(int self_thing, int arg1);
extern int func_ov002_021e286c(int arg0);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern int func_ov002_021ff2b8(int unused_a, int b);
extern int func_ov002_021ff3bc(S021ff3bc *p, int unused1);
extern int func_ov002_0223f6c4(S021ff3bc *p);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_02232d20(S021ff3bc *self, int arg) {
    int side = self->bit0 ^ self->bit14;
    int n;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_021ff3bc(self, arg) == 0) return 0;
        n = func_ov002_021c2f24(side, 0x1919);
        data_ov002_022ce288.selected = n;
        if (n >= func_ov002_021ff2b8((int)self, side))
            n = func_ov002_021ff2b8((int)self, side);
        data_ov002_022ce288.selected = n;
        if (n == 0) return 0;
        if (func_ov002_0225368c(side, self->w0, func_ov002_0223f6c4(self)) == 0) {
            func_ov002_021ae400(side, 0x122);
            return 0x78;
        }
        func_ov002_021ae400(side, 0x11d);
        return 0x7f;
    case 0x7f:
        n = data_ov002_022ce288.selected;
        if (n >= 0x20) n = 0x20;
        func_ov002_021af9d0(side, n + 0x27, self->w0, func_ov002_0223f6c4(self));
        return 0x7e;
    case 0x7e:
        func_ov002_021e2b3c((int)self);
        self->count = data_ov002_022d016c.count;
        data_ov002_022ce288.selected = 0;
        return 0x7d;
    case 0x7d:
        if (data_ov002_022ce288.selected < self->count) {
            func_ov002_0227adb8(side, (int)func_ov002_021b004c(data_ov002_022ce288.selected + 1), 1, self->w0 << 16);
            data_ov002_022ce288.selected++;
            return 0x7d;
        }
        func_ov002_021e2c5c(self->count);
        return 0x64;
    case 0x78:
        func_ov002_021e27c0(side, 1);
        return 0x77;
    case 0x77:
        func_ov002_0226b054(1 - side);
        return 0x76;
    case 0x76:
        func_ov002_021e27c0(side, 0);
        return 0x64;
    case 0x64:
        func_ov002_021e286c(side);
        return 0;
    }
    return 0;
}

