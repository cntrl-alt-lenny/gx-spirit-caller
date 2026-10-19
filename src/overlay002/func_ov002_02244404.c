struct Self {
    unsigned short id;
    unsigned short bit : 1;
    unsigned short rest : 15;
};
struct State { char pad[0x5b8]; int state; };
struct Request { char pad[0xd70]; int player; int slot; int extra; };
extern struct State data_ov002_022ce288;
extern struct Request data_ov002_022d016c;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0223dcc0(struct Self *self, int side, int slot);
extern int func_ov002_0223fd74(void *arg0, int arg1, int arg2);
extern int func_ov002_022575c8(int a0, int a1, int a2);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);

int func_ov002_02244404(struct Self *self) {
    int side, slot;
    switch (data_ov002_022ce288.state) {
    case 0:
        for (side = 0; side < 2; side++) {
            for (slot = 0; slot <= 4; slot++) {
                if (func_ov002_022575c8((int)self, side, slot)) {
                    func_ov002_0223dcc0(self, side, slot);
                    data_ov002_022ce288.state++;
                    return 0;
                }
            }
        }
        return 1;
    case 1:
        func_ov002_021ae400(self->bit, 0x7b);
        data_ov002_022ce288.state++;
        return 0;
    case 2:
        func_ov002_0225935c(self->bit, self->id, (int)func_ov002_0223fd74);
        data_ov002_022ce288.state++;
        return 0;
    case 3:
        if (func_ov002_022593f4()) {
            func_ov002_0223dcc0(self, data_ov002_022d016c.player,
                data_ov002_022d016c.slot + data_ov002_022d016c.extra);
            return 1;
        }
        data_ov002_022ce288.state -= 2;
        return 0;
    default:
        return 1;
    }
}
