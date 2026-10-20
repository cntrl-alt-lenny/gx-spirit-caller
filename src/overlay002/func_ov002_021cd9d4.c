typedef struct { unsigned short flags, kind, id; unsigned char pad[0x806]; int active; int state; } State;
extern State data_ov002_022ce950;
extern char data_ov002_022cf180[];
extern char data_ov002_022cf188[];
extern unsigned int func_ov002_021b947c(int id);
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_021b9a30(unsigned int a, unsigned int b);
extern void func_ov002_021c2c54(int player, unsigned short id);
extern void func_ov002_021c2d34(int player, unsigned short id);
extern int func_ov002_0229ade0(int a, int b, int c, int d);
extern int func_ov002_0229c7f8(int a);

void func_ov002_021cd9d4(void) {
    int f = (data_ov002_022ce950.flags & 0x8000) ? 1 : 0;
    int t;
    int v = data_ov002_022ce950.id;
    t = data_ov002_022ce950.kind;
    int u;
    if (v == 0) u = 0;
    else u = (unsigned short)(func_ov002_021b947c(v) >> 16);
    switch (data_ov002_022ce950.state) {
    case 0:
        if (t == 14) {
            if (func_ov002_021b99b4(f, v) != *(int *)(data_ov002_022cf180 + (f & 1) * 0x868) - 1) {
                func_ov002_021c2c54(f, (unsigned short)v);
                func_ov002_0229ade0(0x16, f, t, v);
            }
        }
        if (t == 15) {
            if (func_ov002_021b9a30(f, v) != *(int *)(data_ov002_022cf188 + (f & 1) * 0x868) - 1) {
                func_ov002_021c2d34(f, (unsigned short)v);
                func_ov002_0229ade0(0x16, f, t, v);
            }
        }
        data_ov002_022ce950.state = data_ov002_022ce950.state + 1;
        break;
    case 1:
        if (func_ov002_0229c7f8(0x16) != 0) return;
        func_ov002_0229ade0(7, f, t, u);
        data_ov002_022ce950.state = data_ov002_022ce950.state + 1;
        break;
    case 2:
        if (func_ov002_0229c7f8(7) == 0) data_ov002_022ce950.active = 0;
        break;
    }
}



