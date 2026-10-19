typedef unsigned short u16;
struct State { char pad[0x5a8]; int state; int count; };
struct Other { char pad[0xcec]; int flag; };
struct Ready { char pad[0xc]; int a; char gap[0x864]; int b; };
struct Info { char pad[0xb0]; u16 value; };
struct Self { u16 value; u16 bit:1; u16 :15; };
extern struct State data_ov002_022ce288;
extern struct Other data_ov002_022d016c;
extern struct Ready data_ov002_022cf16c;
extern struct Info data_ov002_022d0e6c;
extern void func_ov002_021d7970(void *arg0, int arg1, int arg2);
extern int func_ov002_021e104c();
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c();
extern void func_ov002_0226af94(int arg0, int arg1, int arg2);
int func_ov002_022223b8(struct Self *self) {
    int x = data_ov002_022d016c.flag ^ data_ov002_022ce288.count;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (data_ov002_022cf16c.a == 0 || data_ov002_022cf16c.b == 0) return 0;
        data_ov002_022ce288.count = 0;
        func_ov002_021e2b3c(0);
        return 0x7f;
    case 0x7f:
        func_ov002_0226af94(x, self->value, 1);
        return 0x7e;
    case 0x7e:
        func_ov002_021d7970((void *)(1-x), data_ov002_022d0e6c.value, (1-x) != self->bit);
        return 0x7d;
    case 0x7d:
        if (++data_ov002_022ce288.count < 2) return 0x7f;
        func_ov002_021e2c5c();
        return 0x7c;
    case 0x7c:
        func_ov002_021e2b3c(x);
        func_ov002_021e104c(self->bit, 1);
        func_ov002_021e104c(1-self->bit, 1);
        func_ov002_021e2c5c();
        return 0;
    default: return 0;
    }
}

