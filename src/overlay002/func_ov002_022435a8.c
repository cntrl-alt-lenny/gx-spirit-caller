typedef unsigned short u16;
struct Self {
    u16 f0;
    u16 b0 : 1;
    u16 rest : 15;
};
struct Self02243508;
struct State { char pad[0x5b8]; int phase; };
struct Command { char pad[0xd70]; int side; int slot; int extra; };
extern struct State data_ov002_022ce288;
extern struct Command data_ov002_022d016c;
extern int func_ov002_02257ab8(int a, int b);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern void func_ov002_0223dcc0(struct Self *self, int side, int slot);
extern int func_ov002_02243508(struct Self02243508 *self, int arg1, int arg2);

int func_ov002_022435a8(struct Self *self) {
    switch (data_ov002_022ce288.phase) {
    case 0:
        if (func_ov002_02257ab8((int)self, 1 - self->b0) < 2) return 0;
        if (func_ov002_02257ab8((int)self, self->b0) < 1) return 0;
        func_ov002_021ae400(self->b0, 0x64);
        func_ov002_0225935c(self->b0, self->f0, (int)func_ov002_02243508);
        data_ov002_022ce288.phase++;
        return 0;
    case 2:
        func_ov002_0225935c(self->b0, self->f0, (int)func_ov002_02243508);
        data_ov002_022ce288.phase++;
        return 0;
    case 4:
        func_ov002_021ae400(self->b0, 0x7c);
        func_ov002_0225935c(self->b0, self->f0, (int)func_ov002_02243508);
        data_ov002_022ce288.phase++;
        return 0;
    case 1:
    case 3:
    case 5:
        if (func_ov002_022593f4() != 0) {
            func_ov002_0223dcc0(self, data_ov002_022d016c.side, data_ov002_022d016c.slot + data_ov002_022d016c.extra);
            data_ov002_022ce288.phase++;
            return 0;
        }
        data_ov002_022ce288.phase--;
        return 0;
    }
    return 1;
}
