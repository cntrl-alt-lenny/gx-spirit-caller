typedef unsigned short u16;
struct Flags { u16 bit0:1; u16 slot:5; u16 rest:10; };
struct Self { u16 id; struct Flags flags; };
struct State { char pad[0x5b4]; int step; };
struct Request { char pad[0xd70]; int a; int b; int c; };
extern struct State data_ov002_022ce288;
extern struct Request data_ov002_022d016c;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern int func_ov002_022575c8(int a0, int a1, int a2);
extern int func_ov002_021decdc(void *arg0, int arg1, int arg2);
/* The original calls omit the helpers' unused argument. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
int func_ov002_021f6814(struct Self *self) {
    switch (data_ov002_022ce288.step) {
    case 0:
        func_ov002_021ae400(self->flags.bit0, 0x3a);
        func_ov002_0225935c(self->flags.bit0, self->id, (int)func_ov002_022575c8);
        data_ov002_022ce288.step++;
        return 0;
    case 1:
        if (func_ov002_022593f4()) {
            data_ov002_022ce288.step++;
            return 0;
        } else {
            data_ov002_022ce288.step--;
            return 0;
        }
    case 2: {
        int c, b, a;
        a = data_ov002_022d016c.a;
        b = data_ov002_022d016c.b;
        c = data_ov002_022d016c.c;
        func_ov002_021e2b3c();
        func_ov002_021decdc(self, a, b + c);
        func_ov002_021decdc(self, self->flags.bit0, self->flags.slot);
        func_ov002_021e2c5c();
        return 1;
    }
    }
    return 1;
}


