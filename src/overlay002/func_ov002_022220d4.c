struct Self { unsigned short id; unsigned short bit : 1; unsigned short rest : 15; unsigned short pad[3]; unsigned short flag; };
struct State { char pad[0x5a8]; int state; };
struct Command { char pad[0xd70]; int a; int b; int c; };
extern struct State data_ov002_022ce288;
extern struct Command data_ov002_022d016c;
extern int func_ov002_022577dc(void *self);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern int func_ov002_021de910(int a, int b, int c);
extern int func_ov002_0220e75c(void *self, int unused1);
int func_ov002_022220d4(struct Self *self, int arg) {
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (!func_ov002_022577dc(self)) return 0;
        func_ov002_021ae400(self->bit, 0x6e);
        func_ov002_0225935c(self->bit, self->id, (int)func_ov002_0225764c);
        return 0x7f;
    case 0x7f:
        if (func_ov002_022593f4()) {
            if (func_ov002_021de910((int)self, data_ov002_022d016c.a, data_ov002_022d016c.b + data_ov002_022d016c.c)) return 0x7e;
            return 0;
        }
        return 0x80;
    case 0x7e:
        self->flag = 1;
        func_ov002_0220e75c(self, arg);
        return 0;
    }
    return 0;
}
