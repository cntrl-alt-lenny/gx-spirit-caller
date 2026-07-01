extern char data_02197354[];
extern char data_0219739c[];

void *func_020225b4(int a0, int *a1)
{
    char *guard = data_0219739c;
    char *base = data_02197354;
    if (*(int *)(guard + (a0 << 4)) < 0)
        return (void *)0;
    if (a1 != (int *)0) {
        *a1 = *(int *)(base + (a0 << 4) + 0x48);
    }
    return (void *)((base + 0x4c) + (a0 << 4));
}
