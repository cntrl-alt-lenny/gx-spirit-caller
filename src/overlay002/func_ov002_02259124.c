extern char data_ov002_022cf178[];
extern int data_ov002_022d016c[];
extern int func_ov002_021fbf74(int a, int b, int c, int d);
extern int func_ov002_021fc0c8(int a, int b, int c);
extern int func_ov002_022591e4(int a, int b);

int func_ov002_02259124(int a, int b, int c, unsigned int d)
{
    int r = 0;

    switch (c) {
    case 11:
        if (d >= *(unsigned int *)(data_ov002_022cf178 + (b & 1) * 0x868)) {
            return 0;
        }
        if (*(int *)((char *)data_ov002_022d016c + 0xd6c) == b) {
            if (func_ov002_021fc0c8(b, d, a) != 0) {
                r |= 8;
            }
        }
        break;
    case 12:
    case 13:
    case 14:
    case 15:
        r |= func_ov002_022591e4(b, c);
        break;
    default:
        if (func_ov002_021fbf74(*(int *)((char *)data_ov002_022d016c + 0xd6c), b, c + d, a) != 0) {
            r |= 8;
        }
        break;
    }
    return r;
}
