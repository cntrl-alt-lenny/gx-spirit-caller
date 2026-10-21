typedef unsigned int u32;
typedef unsigned short u16;
typedef struct {
    u16 w0;
    u16 bit0 : 1;
    u16 pad1 : 13;
    u16 bit14 : 1;
    u16 pad15 : 1;
    u16 pad4[2];
    u16 count;
} S021ff3bc;
struct State { char pad[0x5a8]; int state; int index; };
struct Other { char pad[0xd44]; int count; };
extern struct State data_ov002_022ce288;
extern struct Other data_ov002_022d016c;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int player, int phase, int card, int arg);
extern u32 *func_ov002_021b004c(int id);
extern int func_ov002_021b3e28(int arg0, int arg1, int arg2);
extern int func_ov002_021b98c4(int side, int id);
extern int func_ov002_021bc618(int arg0);
extern void func_ov002_021e2570(int a, int b, int c);
extern int func_ov002_021e286c(int arg0);
/* The original supplies no argument to this unused parameter. */
extern void func_ov002_021e2b3c();
/* The original supplies no argument to this unused parameter. */
extern void func_ov002_021e2c5c();
extern int func_ov002_021ff3bc(S021ff3bc *p, int unused1);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_0227adb8(int a, int b, int c, int d);

int func_ov002_0222df4c(S021ff3bc *self, int arg1) {
    int n;
    S021ff3bc *p = self;
    u32 *entry;
    n = func_ov002_021b3e28(p->bit0, 11, p->w0);
    switch (data_ov002_022ce288.state) {
    case 128:
        if (func_ov002_021ff3bc(p, arg1) == 0) return 0;
        if (func_ov002_0225368c(p->bit0, p->w0, 0) == 0) {
            func_ov002_021ae400(p->bit0, 13);
            return 100;
        } else {
            func_ov002_021ae400(p->bit0, 48);
            return 127;
        }
    case 127:
        n = n < 32 ? n : 32;
        func_ov002_021af9d0(p->bit0, n + 6, p->w0, 0);
        return 126;
    case 126:
        data_ov002_022ce288.index = 0;
        n = data_ov002_022d016c.count;
        p->count = n;
        func_ov002_021e2b3c();
        return 125;
    case 125:
        if (data_ov002_022ce288.index < p->count) {
            if (func_ov002_021bc618(p->bit0) != 0) {
                n = (int)func_ov002_021b004c(data_ov002_022ce288.index + 1);
                func_ov002_0227adb8(p->bit0, n, 1, p->w0 << 16);
            } else {
                entry = func_ov002_021b004c(data_ov002_022ce288.index + 1);
                n = func_ov002_021b98c4(p->bit0, (((*func_ov002_021b004c(data_ov002_022ce288.index + 1) << 2) >> 24) * 2) + ((*entry << 18) >> 31));
                func_ov002_021e2570(p->bit0, n, 0);
            }
            data_ov002_022ce288.index++;
            return 125;
        }
        func_ov002_021e2c5c();
        return p->count < n ? 100 : 99;
    case 100:
        func_ov002_0226b054(1 - p->bit0);
        return 99;
    case 99:
        func_ov002_021e286c(p->bit0);
        return 0;
    }
    return 0;
}









