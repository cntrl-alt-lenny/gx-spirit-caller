extern char data_ov002_022cf178[];
extern int data_ov002_022d016c[];
extern int func_ov002_021fbf74(int a, int b, int c, int d);
extern int func_ov002_021fc0c8(int a, int b, int c);
extern int func_ov002_022591e4(int a, int b);
extern int func_ov002_02259278(int a, int b);

int func_ov002_02259058(int a, int b, unsigned int c)
{
    int r = 0;

    switch (b) {
    case 11:
        if (c >= *(unsigned int *)(data_ov002_022cf178 + (a & 1) * 0x868)) {
            return 0;
        }
        if (*(int *)((char *)data_ov002_022d016c + 0xd6c) == a) {
            if (func_ov002_021fc0c8(a, c, 0) != 0) {
                r |= 8;
            }
        }
        break;
    case 12:
    case 13:
    case 14:
    case 15:
        r |= func_ov002_022591e4(a, b);
        r |= func_ov002_02259278(a, b);
        break;
    default:
        if (func_ov002_021fbf74(*(int *)((char *)data_ov002_022d016c + 0xd6c), a, b + c, 0) != 0) {
            r |= 8;
        }
        break;
    }
    return r;
}
