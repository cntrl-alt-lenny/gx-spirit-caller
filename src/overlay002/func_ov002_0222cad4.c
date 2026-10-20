typedef struct { unsigned short bit0:1; unsigned short rest:15; } Bits;
typedef struct { unsigned short id; Bits flags; } Self;
typedef struct { char pad[0x5a8]; int state; } State;
typedef struct { char pad[0xd70]; int a; int b; int c; } Command;
extern State data_ov002_022ce288;
extern Command data_ov002_022d016c;
extern char data_ov002_022cf178[];
extern char data_ov002_022cf16c[];
extern int data_ov002_022cd744[];
extern int func_ov002_022577dc(void *self);
extern int func_ov002_021e27c0(int self_thing, int arg1);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021d7c1c(void *a, void *b, void *c);
extern int func_ov002_021decac(int a, int b, int c);
extern int func_ov002_0222ca78(int a, int b, int c);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern void func_ov002_02290500(int a, int b, int (*c)(int,int,int));

int func_ov002_0222cad4(Self *self) {
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (*(int *)(data_ov002_022cf178 + ((1 - self->flags.bit0) & 1) * 0x868) == 0) {
            if (func_ov002_022577dc(self) == 0) return 0;
        }
        func_ov002_021e27c0(1 - self->flags.bit0, 1);
        return 0x7f;
    case 0x7f:
        if (data_ov002_022cd744[self->flags.bit0] == 1) {
            func_ov002_02290500(self->flags.bit0, self->id, func_ov002_0222ca78);
        } else {
            func_ov002_021ae400(self->flags.bit0, 0x3a);
            func_ov002_022592ec((int)func_ov002_0222ca78);
        }
        return 0x7e;
    case 0x7e:
        if (func_ov002_022593f4() != 0) {
            if (data_ov002_022d016c.b == 0xb) {
                func_ov002_021d7c1c(1 - self->flags.bit0,
                    data_ov002_022cf16c + ((1 - self->flags.bit0) & 1) * 0x868 + 0x120 + data_ov002_022d016c.c * 4, 1);
            } else {
                func_ov002_021decac((int)self, data_ov002_022d016c.a, data_ov002_022d016c.b + data_ov002_022d016c.c);
            }
            func_ov002_021e27c0(1 - self->flags.bit0, 0);
            return 0;
        }
        return 0x7f;
    default:
        return 0;
    }
}
