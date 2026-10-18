typedef unsigned short u16;

struct Arg {
    u16 pad0;
    u16 side : 1;
    u16 idx : 5;
    u16 rest : 10;
};

struct Slot {
    unsigned int f0 : 13;
    unsigned int f1 : 19;
    u16 f4;
    u16 f6;
    int f8[3];
};

extern char data_ov002_022cf16c[];
extern int func_ov002_02259f74(int x);
extern int func_ov002_021be384(int a, int b, int c);
extern void func_ov002_021c4c9c(int a, int b, int *out);

int func_ov002_02295a0c(struct Arg *arg)
{
    int i;
    int buf[11];
    int v;

    if (func_ov002_02259f74(arg->side) != 0 && func_ov002_021be384(arg->side, arg->idx, 1) != 0) {
        for (i = 0; i <= 4; i++) {
            int opp = 1 - arg->side;
            struct Slot *s = (struct Slot *)(data_ov002_022cf16c + (opp & 1) * 0x868 + 0x30 + i * 20);
            if (s->f0 != 0) {
                func_ov002_021c4c9c(opp, i, buf);
                s = (struct Slot *)(i * 20 + (data_ov002_022cf16c + ((1 - arg->side) & 1) * 0x868) + 0x30);
                v = s->f6 != 0 ? buf[6] : buf[5];
                if (v >= 1000 && v < 2000) {
                    return 1;
                }
            }
        }
    }
    return 0;
}
