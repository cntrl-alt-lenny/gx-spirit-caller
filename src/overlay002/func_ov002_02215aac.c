struct Obj {
    unsigned short f0;
    unsigned short side : 1;
    unsigned short rest : 15;
    unsigned short a : 2;
    unsigned short skip : 1;
    unsigned short b : 13;
    unsigned short f6;
    unsigned short counts[2];
};
struct State { char pad[0x5a8]; int state; };
struct Side { char pad[0xcec]; int side; };
struct Cards { int pad[3]; int count; char rest[0x858]; };
extern struct State data_ov002_022ce288;
extern struct Side data_ov002_022d016c;
extern struct Cards data_ov002_022cf16c[2];
extern void func_ov002_021d7970(void *arg0, int arg1, int arg2);
/* Original calls supply only r0 and r1 to this four-parameter thunk. */
extern int func_ov002_021e104c();
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
int func_ov002_02215aac(struct Obj *p) {
    int i, j, side;
    int state;
    if (p->skip) return 0;
    switch (state = data_ov002_022ce288.state) {
    case 0x80:
        for (i = 0; i < 2; i++) {
            side = data_ov002_022d016c.side ^ i;
            p->counts[side] = data_ov002_022cf16c[side & 1].count;
            for (j = data_ov002_022cf16c[side & 1].count - 1; j >= 0; j--) {
                func_ov002_021d7970((void *)side, j, p->side != side ? 1 : 0);
            }
        }
        return 0x7f;
    case 0x7f:
        func_ov002_021e2b3c(state);
        func_ov002_021e104c(data_ov002_022d016c.side, p->counts[data_ov002_022d016c.side]);
        return 0x7e;
    case 0x7e:
        side = 1 - data_ov002_022d016c.side;
        func_ov002_021e2c5c(func_ov002_021e104c(side, p->counts[side]));
        return 0x7d;
    }
    return 0;
}


