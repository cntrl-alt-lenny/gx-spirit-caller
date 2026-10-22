extern unsigned char data_ov002_022cf16c[];
typedef struct { int count; unsigned char rest[0x864]; } CountTable;
extern CountTable data_ov002_022cf178[];
extern int func_ov002_021c3cc8(int a0);
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern void func_ov002_021b91c4(int *dst, const int *src);

int func_ov002_021c3d84(int player)
{
    int temp;
    int *base;
    int i;
    int *last;
    int *pick;
    int off;
    int index;
    if (func_ov002_021c3cc8(player) != 0)
        return 0;
    i = data_ov002_022cf178[player & 1].count;
    if (i == 0)
        return 0;
    i--;
    if (i > 0) {
        base = (int *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x120);
        last = base + i;
        do {
            pick = base + func_ov002_021b00d0(i + 1);
            func_ov002_021b91c4(&temp, pick);
            func_ov002_021b91c4(pick, last);
            func_ov002_021b91c4(last, &temp);
            i--;
            last--;
        } while (i > 0);
    }
    return 1;
}





