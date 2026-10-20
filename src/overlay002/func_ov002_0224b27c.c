extern unsigned int data_ov002_022cf180[];
extern char data_ov002_022cf16c[];
extern void func_ov002_02253458(int player, int kind, int index);

void func_ov002_0224b27c(int player)
{
    unsigned int i = 0;
    unsigned int n = *(unsigned int *)((char *)data_ov002_022cf180 + (player & 1) * 0x868);
    if (n <= i)
        return;
    do {
        func_ov002_02253458(player, 14, i);
        i++;
    } while (i < *(unsigned int *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x14));
}
