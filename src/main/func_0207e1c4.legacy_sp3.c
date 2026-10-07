typedef struct { int cur,end,base,unk_0x0c; short slot_index,unk_0x12; int unk_0x14; } DuelHeapSlot;
extern DuelHeapSlot data_02102120;
extern void *data_0210210c[5];
void func_0207e1c4(int a, int b, int c, int d, int e)
{
    data_0210210c[0] = &data_02102120+a;
    data_0210210c[1] = &data_02102120+b;
    data_0210210c[2] = &data_02102120+c;
    data_0210210c[3] = &data_02102120+d;
    data_0210210c[4] = &data_02102120+e;
}
