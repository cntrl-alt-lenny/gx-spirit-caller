typedef unsigned short u16;
struct Card {
    u16 id;
    u16 side : 1;
    u16 unused2 : 13;
    u16 flipped : 1;
    u16 unused3 : 1;
    u16 unused4 : 5;
    u16 active : 1;
    u16 unused5 : 10;
    u16 pad[9];
    u16 effect;
    u16 owner : 1;
    u16 unused6 : 15;
};
struct Self022101c4Arg;
struct State { char pad[0x5a8]; int mode; };
struct Scratch { char pad[0xd44]; int ready; char pad2[0x28]; int a, b, c; };
extern struct State data_ov002_022ce288;
extern struct Scratch data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern int func_ov002_022101c4(int arg0, struct Self022101c4Arg *self);
extern int func_ov002_02257878();
extern int func_ov002_021ebf40(struct Card *, int, int);
extern int func_ov002_021ae484(int x);
extern int func_ov002_022593a8(int a, int b, int c);
extern int func_ov002_022593f4(void);
extern void func_ov002_021e2b3c(int unused0);
extern int func_ov002_021de4b0(int arg0, int arg1, int arg2);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021df818(struct Card *card, int side, int amount);
extern void func_ov002_021e2c5c();
int func_ov002_0221fcbc(struct Card *self, struct Self022101c4Arg *arg, int unused, int d) {
    int c, b, a;
    switch (data_ov002_022ce288.mode) {
    case 0x80:
        func_ov002_022101c4((int)self, arg);
        return 0x7f;
    case 0x7f:
        if (func_ov002_02257878((int)self, (int)func_ov002_021ebf40) == 0) return 0;
        if (data_ov002_022cd744[self->side] == 1) {
            data_ov002_022d016c.ready = 1;
        } else {
            func_ov002_021ae484(0x68);
        }
        return 0x7e;
    case 0x7e:
        if (data_ov002_022d016c.ready == 0) return 0;
        func_ov002_022593a8(self->side, self->id, (int)func_ov002_021ebf40);
        return 0x7d;
    case 0x7d:
        if (func_ov002_022593f4() == 0) return 0x7f;
        a = data_ov002_022d016c.a;
        b = data_ov002_022d016c.b;
        c = data_ov002_022d016c.c;
        func_ov002_021e2b3c((int)&data_ov002_022d016c);
        func_ov002_021de4b0((int)self, a, b + c);
        func_ov002_021df818(self, 1 - self->side, func_ov002_021c8470(a, b + c));
        func_ov002_021e2c5c();
        return 0;
    }
    return 0;
}



