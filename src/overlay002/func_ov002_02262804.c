struct DuelState {
    char pad[0xd2c];
    unsigned int step;
    int sub;
    char pad2[0x68];
    int state;
};
struct EventState {
    int player;
    char pad[0x10];
    int active;
    int pad2;
    int value;
};
extern struct DuelState data_ov002_022d016c;
extern struct EventState data_ov002_022cd3f4;
extern void func_ov002_021e2cd4(int bit, int val);
extern void func_ov002_021e2d20(int arg0, int arg1, int arg2);
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
extern int func_ov002_022627ac(int a);

int func_ov002_02262804(int a, int b)
{
    switch (data_ov002_022d016c.state) {
    case 0:
        data_ov002_022d016c.step = 6;
        data_ov002_022d016c.sub = 1;
        func_ov002_021e2cd4(0, 1);
        func_ov002_021e2d20(a, 0x13, 1);
        if (b != 0) {
            func_ov002_021d479c((unsigned short)((data_ov002_022cd3f4.player != 0 ? 0x8000 : 0) | 0x1b), (unsigned short)data_ov002_022cd3f4.value, 1, 0);
        }
        data_ov002_022cd3f4.active = 1;
        data_ov002_022d016c.state++;
        break;
    case 1:
        func_ov002_022627ac(a);
        return data_ov002_022d016c.step >= 9;
    }
    return 0;
}
