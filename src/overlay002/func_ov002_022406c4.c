typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 id; u16 side:1; u16 rest:15; };
struct S0223dad0;
struct State { char pad[0x5b8]; int state; };
struct Request { char pad[0xd44]; int mode; char pad2[0x28]; int side, slot, extra; };
extern struct State data_ov002_022ce288;
extern struct Request data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern int func_ov002_0228df3c(struct Self *, int, int);
extern void func_ov002_0223dad0(struct S0223dad0 *, unsigned short);
extern void func_ov002_021ae400(int, int);
extern int func_ov002_021e8a18(void *, int, int);
extern void func_ov002_0225935c(int, int, int);
extern int func_ov002_022593f4(void);
extern void func_ov002_0223dcc0(struct Self *, int, int);
extern int func_ov002_021ae514(int, int, int, int, int, u32);
extern int func_ov002_0226b0d0(int, int, int);
int func_ov002_022406c4(struct Self *self, int arg1) {
    if (data_ov002_022cd744[self->side] == 1) {
        func_ov002_0228df3c(self, arg1, 0x10d3);
        func_ov002_0223dad0((struct S0223dad0 *)self, 1);
        return 1;
    }
    switch (data_ov002_022ce288.state) {
    case 0:
        func_ov002_021ae400(self->side, 0x65);
        func_ov002_0225935c(self->side, self->id, (int)func_ov002_021e8a18);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        if (func_ov002_022593f4()) {
            func_ov002_0223dcc0(self, data_ov002_022d016c.side, data_ov002_022d016c.slot + data_ov002_022d016c.extra);
            data_ov002_022ce288.state++;
            return 0;
        }
        data_ov002_022ce288.state--;
        return 0;
    case 2:
        func_ov002_021ae514(0x7f, 0x198, 0x199, 0, 0, 0xf);
        data_ov002_022ce288.state++;
        return 0;
    case 3:
        func_ov002_0223dad0((struct S0223dad0 *)self, (u16)(data_ov002_022d016c.mode + 1));
        func_ov002_0226b0d0(1 - self->side, self->id, data_ov002_022d016c.mode);
        return 1;
    }
    return 0;
}

