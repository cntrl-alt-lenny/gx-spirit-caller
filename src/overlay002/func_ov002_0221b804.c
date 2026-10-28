typedef unsigned short u16;
struct Obj { u16 f0; u16 side : 1; u16 rest : 15; };
struct State { char pad[0x5a8]; int state; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf178[];
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern void func_ov002_0226ad5c(int arg0, int arg1, int arg2, int arg3);
int func_ov002_0221b804(struct Obj *self) {
    switch (data_ov002_022ce288.state) {
    case 0x80:
        func_ov002_021e2b3c((int)self);
        return 0x7f;
    case 0x7f: {
        int side = self->side;
        if (*(int *)(data_ov002_022cf178 + (side & 1) * 0x868) != 0)
            func_ov002_0226ad5c(side, 1, 0, 0);
        return 0x7e;
    }
    case 0x7e: {
        int side = 1 - self->side;
        if (*(int *)(data_ov002_022cf178 + (side & 1) * 0x868) != 0)
            func_ov002_0226ad5c(side, 1, 0, 1);
        return 0x7d;
    }
    case 0x7d:
        func_ov002_021e2c5c((int)self);
        return 0;
    default:
        return 0;
    }
}
