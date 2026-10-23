typedef unsigned int u32;
struct Slot { u32 id:13; u32 pad:1; u32 flag:1; u32 rest:17; };
struct State { int a, b, active; int count; };
extern char data_ov002_022cdc78[];
extern char data_ov002_022cdc88[];
extern int func_ov002_0229ade0(int, int, int, int);
int func_ov002_021ae514(int self, int a, int b, int c, int d, u32 flags)
{
    int values[4] = {a, b, c, d};
    int i;
    ((int *)data_ov002_022cdc78)[3] = 0;
    for (i = 0; i < 4; i++) {
        ((struct Slot *)data_ov002_022cdc88)[i].id = values[i];
        ((struct Slot *)data_ov002_022cdc88)[i].flag = flags >> i;
        ((int *)data_ov002_022cdc78)[3] += values[i] != 0;
    }
    ((int *)data_ov002_022cdc78)[2] = 0;
    return func_ov002_0229ade0(0x31, 3, self, 0);
}



