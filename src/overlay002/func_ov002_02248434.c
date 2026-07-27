extern char data_ov002_022cf16c[];
extern void func_ov002_02253458(int a, int b, int c);

void func_ov002_02248434(int player)
{
    int i = 0;
    char *row = data_ov002_022cf16c + (player & 1) * 0x868;

    for (; i < *(unsigned int *)(row + 0x10) && i < 5; i++)
        func_ov002_02253458(player, 13, i);
}
