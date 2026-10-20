typedef unsigned short u16;
struct Self { u16 f0; u16 side:1; u16 rest:15; };
struct State { char pad[0x5b8]; int state; };
struct Scratch { char pad0[0xd44]; int d44; char pad1[0x28]; int d70, d74, d78; };
extern struct State data_ov002_022ce288;
extern struct Scratch data_ov002_022d016c;
extern int func_ov002_022577dc(void *self);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern void func_ov002_0223dcc0(struct Self *self, int side, int slot);
/* This caller supplies only r0/r1; the C thunk definition has four parameters. */
extern int func_ov002_021bbc58();
extern int func_ov002_021ae484(int x);
extern int func_ov002_0223fd74(void *arg0, int arg1, int arg2);
int func_ov002_02242c40(struct Self *self) {
    switch (data_ov002_022ce288.state) {
    case 0:
        if (func_ov002_022577dc(self) == 0) return 1;
        func_ov002_021ae400(self->side, 0x6f);
        func_ov002_0225935c(self->side, self->f0, (int)func_ov002_0223fd74);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        if (func_ov002_022593f4() != 0) {
            func_ov002_0223dcc0(self, data_ov002_022d016c.d70, data_ov002_022d016c.d74 + data_ov002_022d016c.d78);
            data_ov002_022ce288.state++;
            return 0;
        } else {
            data_ov002_022ce288.state--;
            return 0;
        }
    case 2:
        if (func_ov002_022577dc(self) <= 1) return 1;
        if (func_ov002_021bbc58(self->side, 0xf) == 0) return 1;
        func_ov002_021ae484(0x75);
        data_ov002_022ce288.state++;
        return 0;
    case 3:
        if (data_ov002_022d016c.d44 == 0) return 1;
        func_ov002_0225935c(self->side, self->f0, (int)func_ov002_0223fd74);
        data_ov002_022ce288.state++;
        return 0;
    case 4:
        if (func_ov002_022593f4() != 0) {
            func_ov002_0223dcc0(self, data_ov002_022d016c.d70, data_ov002_022d016c.d74 + data_ov002_022d016c.d78);
            return 1;
        } else {
            data_ov002_022ce288.state -= 2;
            return 0;
        }
    }
    return 0;
}
