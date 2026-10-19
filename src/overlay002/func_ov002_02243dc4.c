typedef unsigned short u16;
struct S0223dad0 {
    u16 id;
    u16 side:1;
    u16 rest:15;
    u16 pad;
    u16 lo:8;
    u16 hi:8;
    u16 arr[1];
};
struct Ov002Self;
struct State { char pad[0x5b8]; int state; };
struct Values { char pad[0xd70]; int a; int b; int c; };
extern struct State data_ov002_022ce288;
extern struct Values data_ov002_022d016c;
extern int func_ov002_02243d28(struct Ov002Self *self, int player, int idx);
/* This caller supplies only r0/r1; the thunk's four-argument definition forwards unused registers. */
extern int func_ov002_02257878();
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_022593a8(int a, int b, int c);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern int func_ov002_021d8770(int arg0, int arg1);
extern void func_ov002_0223dad0(struct S0223dad0 *self, unsigned short val);
int func_ov002_02243dc4(struct S0223dad0 *self) {
    int a, b;
    switch (data_ov002_022ce288.state) {
    case 0:
        if (func_ov002_02257878(self, func_ov002_02243d28) == 0)
            return -1;
        func_ov002_021ae400(self->side, 0x9b);
        func_ov002_022593a8(self->side, self->id, (int)func_ov002_02243d28);
        data_ov002_022ce288.state++;
        return 0;
    case 2:
    case 4:
        func_ov002_0225935c(self->side, self->id, (int)func_ov002_02243d28);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
    case 3:
    case 5:
        if (func_ov002_022593f4() != 0) {
            a = data_ov002_022d016c.a;
            b = data_ov002_022d016c.b + data_ov002_022d016c.c;
            func_ov002_021d8770(a, b);
            func_ov002_0223dad0(self, (u16)((unsigned char)a | ((unsigned char)b << 8)));
            if (func_ov002_02257878(self, func_ov002_02243d28) == 0)
                return 1;
            data_ov002_022ce288.state++;
            return 0;
        }
        if (self->hi != 0)
            return 1;
        data_ov002_022ce288.state--;
        return 0;
    }
    return 1;
}
