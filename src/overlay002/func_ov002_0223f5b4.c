typedef unsigned short u16;
struct Self { u16 id; u16 side:1; u16 rest:15; };
struct State { char pad[0x5b8]; int step; };
struct Command { char pad[0xd70]; int side; int slot; int offset; };
extern struct State data_ov002_022ce288;
extern struct Command data_ov002_022d016c;
extern void func_ov002_0223dcc0(struct Self *self, int side, int slot);
extern void func_ov002_0223e21c(struct Self *self, int arg1);
extern int func_ov002_022575c8(int a0, int a1, int a2);
extern int func_ov002_022577dc(void *self);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
int func_ov002_0223f5b4(struct Self *self, int arg1) {
    switch (data_ov002_022ce288.step) {
    case 0:
        if (func_ov002_022577dc(self) == 0) return 1;
        func_ov002_0223e21c(self, arg1);
        func_ov002_0225935c(self->side, self->id, (int)func_ov002_022575c8);
        data_ov002_022ce288.step++;
        return 0;
    case 1:
        if (func_ov002_022593f4() != 0) {
            func_ov002_0223dcc0(self, data_ov002_022d016c.side, data_ov002_022d016c.slot + data_ov002_022d016c.offset);
            return 1;
        }
        data_ov002_022ce288.step--;
        return 0;
    }
    return 1;
}
