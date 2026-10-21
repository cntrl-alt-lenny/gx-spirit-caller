extern int data_ov002_022cd3f4[];
extern char data_ov002_022cd4b8[];
extern char data_ov002_022cd4cc[];
extern char data_ov002_022cf16c[];
extern unsigned int data_ov002_022d016c[];
extern void *func_ov002_021c93f0(int player, int kind, int extra);
extern int func_ov002_021ba524(int player, int *p);
extern int func_ov002_021ba430(int player, int *p);
extern int func_ov002_021c2bd4(int player, int *arg1);
extern int func_ov002_021c3150(int player, int *p);
extern int func_ov002_021c37f4(int player, int *p);
extern void func_ov002_021b229c(void *p);
extern void func_ov002_021b1e80(int a0, int a1);
extern int func_ov002_021ba9e8(void *p);

void func_ov002_021baa04(int player, int kind, int extra) {
    void *p = func_ov002_021c93f0(player, kind, extra);
    int sum;
    switch (kind) {
    case 12:
        func_ov002_021ba524(player, p);
        return;
    case 13:
        func_ov002_021ba430(player, p);
        return;
    case 14:
        func_ov002_021c2bd4(player, p);
        func_ov002_021b229c(p);
        return;
    case 15:
        func_ov002_021c3150(player, p);
        func_ov002_021b229c(p);
        return;
    case 11:
        func_ov002_021c37f4(player, p);
        return;
    }
    sum = kind + extra;
    if (sum > 10) {
        func_ov002_021ba9e8(player == data_ov002_022cd3f4[0] && kind == data_ov002_022cd3f4[7] ? data_ov002_022cd4b8 : data_ov002_022cd4cc);
    } else {
        func_ov002_021b1e80(player, sum);
        func_ov002_021ba9e8(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30 + sum * 0x14);
        data_ov002_022d016c[0x35] &= ~(1 << (extra + (kind + (player << 4))));
    }
}

