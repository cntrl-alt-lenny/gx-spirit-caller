typedef unsigned short u16;
struct Self { u16 id; u16 bit:1; u16 value:5; u16 rest:10; u16 pad[4]; u16 choice; };
struct State { char pad[0x5a8]; int state; };
struct Counts { char pad[0xb0]; u16 a,b; };
struct Result { char pad[0xd44]; unsigned mask; char pad2[0x28]; int a,b,c; };
extern struct State data_ov002_022ce288;
extern struct Counts data_ov002_022d0e6c;
extern struct Result data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern int func_ov002_021e9e58(void *, int, int);
extern int func_ov002_0226b274(int arg0, int arg1, int arg2);
extern int func_ov002_0225792c(void *self, int player, int (*fn)(void *, int, int));
extern void func_ov002_021ae6a4(int p, unsigned int b, unsigned int c);
/* Original caller supplies only r0 and r1 to this four-parameter thunk. */
extern int func_ov002_02257878();
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern int func_ov002_021de4b0(int arg0, int arg1, int arg2);
int func_ov002_02226e8c(struct Self *self) {
    unsigned a, b;
    int i;
    switch (data_ov002_022ce288.state) {
    case 128:
        func_ov002_0226b274(self->bit, self->value, 2);
        return 127;
    case 127:
        b = data_ov002_022d0e6c.b;
        a = data_ov002_022d0e6c.a;
        if (a != b) {
            if (data_ov002_022cd744[self->bit] == 1) {
                if (a <= b) a = b;
                self->choice = a;
                if (func_ov002_0225792c(self, 1-self->bit, func_ov002_021e9e58)) {
                    data_ov002_022d016c.mask = 1 << a;
                } else {
                    b = data_ov002_022d0e6c.b;
                    a = data_ov002_022d0e6c.a;
                    if (a >= b) a = b;
                    data_ov002_022d016c.mask = 1 << a;
                }
            } else {
                func_ov002_021ae6a4(0x140, 1, (1 << a) + (1 << b));
            }
        } else {
            data_ov002_022d016c.mask = 1 << a;
        }
        return 126;
    case 126:
        for (i = 1; i <= 6; i++) {
            if (data_ov002_022d016c.mask & (1 << i)) self->choice = i;
        }
        if (func_ov002_02257878((int)self, func_ov002_021e9e58) == 0) return 0;
        func_ov002_021ae400(self->bit, 0x6d);
        func_ov002_0225935c(self->bit, self->id, (int)func_ov002_021e9e58);
        return 125;
    case 125:
        if (func_ov002_022593f4() == 0) return 126;
        func_ov002_021de4b0((int)self, data_ov002_022d016c.a, data_ov002_022d016c.b + data_ov002_022d016c.c);
        return 0;
    default:
        return 0;
    }
}


