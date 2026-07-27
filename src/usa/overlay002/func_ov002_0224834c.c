extern char data_ov002_022cf08c[];
extern void func_ov002_02253370(int a, int b, int c);

void func_ov002_0224834c(int player)
{
    int i = 0;
    char *row = data_ov002_022cf08c + (player & 1) * 0x868;

    for (; i < *(unsigned int *)(row + 0x10) && i < 5; i++)
        func_ov002_02253370(player, 13, i);
}
