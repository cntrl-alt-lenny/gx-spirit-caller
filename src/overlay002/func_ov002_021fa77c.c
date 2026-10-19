typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u16 id; u16 bit0:1; u16 rest:15; u16 pad[4]; u16 count; } Self;
extern struct { char pad[0x5b4]; int state; } data_ov002_022ce288;
extern struct { char pad[0xd44]; u32 count; } data_ov002_022d016c;
extern int func_ov002_021f4a84(Self *self, int arg);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern u32 *func_ov002_021b004c(int id);
extern void func_ov002_021d8128(int arg0, void *arg1, int arg2);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c();
extern int func_ov002_022577dc(void *self);
int func_ov002_021fa77c(Self *self, int arg) {
    u32 i;
    int result, value;
    switch (data_ov002_022ce288.state) {
    case 0: case 1: case 2:
        result = func_ov002_021f4a84(self, arg);
        if (result != 1) return result;
        data_ov002_022ce288.state = 5;
        return 0;
    case 5:
        func_ov002_021ae400(self->bit0, 0x56);
        data_ov002_022ce288.state++;
        return 0;
    case 6:
        value = func_ov002_022577dc(self);
        func_ov002_021af9d0(self->bit0, ((value < 5 ? value : 5) < 0x20 ? (value < 5 ? value : 5) : 0x20) + 0x27, self->id, 0);
        data_ov002_022ce288.state++;
        return 0;
    case 7:
        func_ov002_021e2b3c((int)self);
        for (i = 0; i < data_ov002_022d016c.count; i++) {
            func_ov002_021d8128(self->bit0, func_ov002_021b004c(i + 1), 0);
        }
        func_ov002_021e2c5c();
        self->count = data_ov002_022d016c.count;
        return 1;
    default: return 1;
    }
}


