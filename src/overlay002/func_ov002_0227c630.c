extern int func_ov002_021bb068(int a);
extern char data_ov002_022cf16c[];

int func_ov002_0227c630(int a)
{
    int v = func_ov002_021bb068(0x132c) * 500;
    int x = *(int *)(data_ov002_022cf16c + (a & 1) * 0x868);
    return x > v;
}
