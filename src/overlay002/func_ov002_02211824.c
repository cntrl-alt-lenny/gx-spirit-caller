typedef unsigned short u16;
struct Card { u16 id; u16 side : 1; u16 rest : 15; };
struct State { char pad[0x5a8]; int mode; };
struct Side { int value; char pad[0x864]; };
extern struct State data_ov002_022ce288;
extern struct Side data_ov002_022cf17c[];
extern int data_ov002_022cd744[];
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern void func_ov002_021e1bf8(int arg0);
int func_ov002_02211824(struct Card *c) {
    int n = 0;
    switch (c->id) {
    case 0x1051: n = 5; break;
    case 0x162c: n = 3; break;
    case 0x184c: n = 3; break;
    }
    switch (data_ov002_022ce288.mode) {
    case 0x80:
        if (data_ov002_022cf17c[c->side & 1].value == 0) return 0;
        if (data_ov002_022cd744[c->side] == 1) return 0;
        func_ov002_021ae400(c->side, 0xf5);
        return 0x7f;
    case 0x7f:
        if (n >= 0x20) n = 0x20;
        func_ov002_021af9d0(c->side, n + 6, c->id, 0);
        return 0x7e;
    case 0x7e:
        func_ov002_021e1bf8(c->side);
        return 0;
    }
    return 0;
}
