extern int data_ov002_022cf180[];
extern char data_ov002_022cf16c[];
extern void func_ov002_02253458(int a, int b, int c);

void func_ov002_0224b550(int player)
{
    unsigned int i = 0;
    unsigned int p = 1 - player;
    unsigned int n = *(unsigned int *)((char *)data_ov002_022cf180 + (p & 1) * 0x868);

    if (i >= n) {
        return;
    }
    do {
        func_ov002_02253458(p, 14, i);
        i++;
    } while (i < *(unsigned int *)(data_ov002_022cf16c + (p & 1) * 0x868 + 0x14));
}
