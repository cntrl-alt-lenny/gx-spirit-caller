typedef unsigned short u16;
struct Self {
    u16 id;
    u16 side:1; u16 rest2:15;
    u16 low4:2; u16 blocked:1; u16 rest4:13;
    u16 lo6:8; u16 hi6:8;
    u16 value;
};
struct State { char pad[0x5a8]; int mode; int mask; };
struct Command { char pad[0xd70]; int side; int slot; int extra; };
extern struct State data_ov002_022ce288;
extern struct Command data_ov002_022d016c;
extern int func_ov002_02216004(unsigned short *p, unsigned short *out);
extern int func_ov002_022577dc(void *self);
extern int func_ov002_02257704(void *self);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern int func_ov002_021de408(int a, int b);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
int func_ov002_02216180(struct Self *self) {
    if (self->blocked) return 0;
    switch (data_ov002_022ce288.mode) {
    case 0x80:
        self->hi6 = 0;
        self->value = func_ov002_02216004((u16 *)self, 0);
        if (self->value == 0xffff) return 0;
        self->hi6 = 1;
        return 0x7f;
    case 0x7f:
        if (func_ov002_022577dc(self) > 1) {
            switch (self->id) {
            case 0x1540:
                data_ov002_022ce288.mask = func_ov002_02257704(self);
                return 0x78;
            case 0x17f2:
            case 0x195e:
                func_ov002_021ae400(self->side, 0x6d);
                break;
            default:
                func_ov002_021ae400(self->side, 0x62);
                break;
            }
            func_ov002_0225935c(self->side, self->id, (int)func_ov002_0225764c);
            return 0x7e;
        }
        data_ov002_022ce288.mask = func_ov002_02257704(self);
        return 0x78;
    case 0x7e: {
        if (func_ov002_022593f4() == 0) return 0x7f;
        int sum = data_ov002_022d016c.slot + data_ov002_022d016c.extra;
        int side = data_ov002_022d016c.side;
        data_ov002_022ce288.mask = 1 << (sum + (side << 4));
        return 0x78;
    }
    case 0x78:
        func_ov002_021de408((int)self, data_ov002_022ce288.mask);
        return 0;
    default:
        return 0;
    }
}




