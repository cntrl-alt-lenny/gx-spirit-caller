typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    u16 w0;
    u16 bit0:1;
    u16 pad1:13;
    u16 bit14:1;
    u16 pad15:1;
    u16 pad4[2];
    u16 index;
    u16 count;
} S021ff400;
struct State { char pad[0x5a8]; int state; };
extern struct State data_ov002_022ce288;
extern int func_ov002_021ff400(S021ff400 *p, int unused1);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c();
extern u32 *func_ov002_021b004c(int id);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_0222e720(S021ff400 *self, int unused1) {
    int side = self->bit0 ^ self->bit14;
    switch (data_ov002_022ce288.state) {
    case 0x80: {
        int n;
        if (func_ov002_021ff400(self, unused1) == 0) return 0;
        n = func_ov002_021bc618(side);
        if (n < func_ov002_0225368c(side, self->w0, 0))
            self->count = func_ov002_021bc618(side);
        else
            self->count = func_ov002_0225368c(side, self->w0, 0);
        if (self->count == 0) return 0;
        func_ov002_021ae400(side, 0x11d);
        return 0x7e;
    }
    case 0x7e:
        func_ov002_021af9d0(side, (self->count < 0x20 ? self->count : 0x20) + 6, self->w0, 0);
        self->index = 0;
        func_ov002_021e2b3c(0);
        return 0x7d;
    case 0x7d: {
        if (self->index < self->count) {
            u32 *p = func_ov002_021b004c(self->index + 1);
            func_ov002_0227adb8(side, (int)p, 1, self->w0 << 16);
            self->index++;
            return 0x7d;
        }
        func_ov002_021e2c5c();
        return 0;
    }
    default:
        return 0;
    }
}




