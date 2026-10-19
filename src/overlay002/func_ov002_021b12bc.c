extern char data_ov002_022d016c[];
extern int func_0202e234(int x);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern void func_ov002_02258168(int a);
extern void func_ov002_022582b4(int arg);
extern void func_ov002_02258384(void);
extern void func_ov002_022583b4(int a, int b, int c);
extern void func_ov002_022584ac(int a);
extern void func_ov002_02258500(int a, int b, int c);
extern void func_ov002_022585dc(void);
extern int func_ov002_02271a78(int arg0, int arg1, int arg2);

void func_ov002_021b12bc(void)
{
    int state = *(int *)(data_ov002_022d016c + 0xd64);
    switch (state) {
    case 8:
    case 9:
        func_ov002_022584ac((unsigned short)state);
        return;
    case 5:
        func_ov002_02258384();
        return;
    case 6:
        func_ov002_02271a78(0, 0, 1);
        return;
    case 7:
        func_ov002_022583b4(0, 0, 0);
        return;
    case 4:
        func_ov002_02271a78(1, 0, 1);
        return;
    case 2:
        func_ov002_02271a78(1, 1, 0);
        return;
    case 3:
        {
            int kind = *(int *)(data_ov002_022d016c + 0xd74);
            switch (kind) {
            case 11:
                if (func_0202e234(*(int *)(data_ov002_022d016c + 0xd5c))) {
                    func_ov002_022582b4(0);
                    return;
                }
                func_ov002_022583b4(1, 0, 0);
                return;
            case 12:
            case 13:
            case 14:
            case 15:
                func_ov002_02258500(0, *(int *)(data_ov002_022d016c + 0xd70), kind);
                return;
            default:
                func_ov002_02258168(0);
                return;
            }
        }
    case 10:
        func_ov002_022585dc();
        return;
    case 1:
        func_ov002_021af9d0(*(int *)(data_ov002_022d016c + 0xd70), *(int *)(data_ov002_022d016c + 0xd74) - 11, -1, *(int *)(data_ov002_022d016c + 0xd74));
        *(int *)(data_ov002_022d016c + 0xd50) = 0;
        return;
    default:
        *(int *)(data_ov002_022d016c + 0xd50) = 0;
        return;
    }
}
