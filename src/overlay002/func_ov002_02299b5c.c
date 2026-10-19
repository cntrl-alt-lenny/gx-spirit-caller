extern int data_ov002_022cd524[];
struct DuelState { char pad[0xcec]; int player; char gap[0x3c]; int step; int sub; int flag; };
extern struct DuelState data_ov002_022d016c;
extern int func_ov002_02259f74(int x);
extern int func_ov002_0225a0e0(int x);
extern int func_ov002_02285dd0(void *self, void *arg1);
extern int func_ov002_02297c80(void *thing, int flag);
extern void func_ov002_02244fe4(int a, unsigned int b);
extern int func_ov002_022627ac(int a);
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
int func_ov002_02299b5c(void)
{
    int a = data_ov002_022d016c.player;
    switch (data_ov002_022cd524[2]) {
    case 0:
        if (!func_ov002_02259f74(a)) return 1;
        if (func_ov002_0225a0e0(a)) {
            if (!func_ov002_02285dd0((void *)a, 0)) return 1;
        }
        if (func_ov002_02297c80((void *)a, 1)) return 0;
        data_ov002_022d016c.step = 0;
        data_ov002_022d016c.sub = 0;
        data_ov002_022cd524[2]++;
        break;
    case 1:
        func_ov002_02244fe4(3, 0);
        data_ov002_022cd524[2]++;
        break;
    case 2:
        if (func_ov002_022627ac(a)) {
            if (data_ov002_022d016c.flag) return 1;
            data_ov002_022cd524[2]++;
        }
        break;
    case 3:
        func_ov002_021d479c((a ? 0x8000 : 0) | 0x10, 0, 0, 0);
        return 1;
    }
    return 0;
}

