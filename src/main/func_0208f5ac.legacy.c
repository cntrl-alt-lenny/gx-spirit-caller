extern int func_0208cf20(void);
extern int data_021a6334;
extern int data_021a6330;
extern int data_021a632c;

void func_0208f5ac(void)
{
    int r = func_0208cf20();
    data_021a6334 = r;
    switch (r) {
    case 0:
        return;
    case 0x10:
        data_021a6330 = 0x06880000;
        data_021a632c = 0;
        return;
    case 0x40:
        data_021a6330 = 0x06894000;
        data_021a632c = 0x4000;
        return;
    case 0x20:
    case 0x60:
        data_021a6330 = 0x06890000;
        data_021a632c = 0;
        return;
    }
}
