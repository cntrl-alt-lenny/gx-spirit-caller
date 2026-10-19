typedef unsigned short u16;
struct Self { u16 f0; u16 side:1; };
struct State { char pad[0x5b8]; int state; };
struct Context { int side; char pad[0x18]; int slot; };
struct Scratch { char pad[0xd70]; int d70, d74, d78; };
extern struct State data_ov002_022ce288;
extern struct Context data_ov002_022cd3f4;
extern int data_ov002_022cd744[];
extern struct Scratch data_ov002_022d016c;
extern void func_ov002_0223dcc0(struct Self *self, int side, int slot);
extern void func_ov002_0223e21c(struct Self *self, int arg1);
extern int func_ov002_022575c8(int a0, int a1, int a2);
extern int func_ov002_022577dc(void *self);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern int func_ov002_0228df3c(struct Self *self, int arg1, int arg2);
int func_ov002_022426a4(struct Self *self, int arg1) {
    switch (data_ov002_022ce288.state) {
    case 0:
        func_ov002_0223dcc0(self, data_ov002_022cd3f4.side, data_ov002_022cd3f4.slot);
        if (data_ov002_022cd744[self->side] == 1) {
            return func_ov002_0228df3c(self, arg1, self->f0);
        }
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        if (func_ov002_022577dc(self) == 0) return 1;
        func_ov002_0223e21c(self, arg1);
        func_ov002_0225935c(self->side, self->f0, (int)func_ov002_022575c8);
        data_ov002_022ce288.state++;
        return 0;
    case 2:
        if (func_ov002_022593f4() != 0) {
            func_ov002_0223dcc0(self, data_ov002_022d016c.d70, data_ov002_022d016c.d74 + data_ov002_022d016c.d78);
            data_ov002_022ce288.state++;
            return 0;
        } else {
            data_ov002_022ce288.state--;
            return 0;
        }
    default: return 1;
    }
}
