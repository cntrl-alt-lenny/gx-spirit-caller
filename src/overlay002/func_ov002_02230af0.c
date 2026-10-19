typedef unsigned short u16;
struct Ov002Self { u16 a; u16 b:1; u16 pad:15; };
struct State { char pad[0x5a8]; int state; int mask; int index; };
extern struct State data_ov002_022ce288;
extern int func_ov002_02257704(void *self);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern int func_ov002_021d5a08(struct Ov002Self *arg0, int arg1, int arg2, int arg3, u16 arg4, u16 arg5);
extern void func_ov002_0226b11c(int arg0, int arg1);
int func_ov002_02230af0(struct Ov002Self *self) {
    int side, slot;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        data_ov002_022ce288.mask = func_ov002_02257704(self);
        if (data_ov002_022ce288.mask == 0) return 0;
        func_ov002_021e2b3c(data_ov002_022ce288.mask);
        data_ov002_022ce288.index = 0;
        return 0x7f;
    case 0x7f:
        for (; data_ov002_022ce288.index < 10; data_ov002_022ce288.index++) {
            side = self->b ^ data_ov002_022ce288.index / 5;
            slot = data_ov002_022ce288.index % 5;
            if (data_ov002_022ce288.mask & (1 << (slot + (side << 4)))) {
                func_ov002_021d5a08(self, side, slot, self->a, 5, 0);
                func_ov002_0226b11c(side, slot);
                data_ov002_022ce288.index++;
                return 0x7f;
            }
        }
        func_ov002_021e2c5c((int)self);
        return 0;
    }
    return 0;
}



