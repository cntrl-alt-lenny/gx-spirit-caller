extern int data_021a6324;
extern int data_021a6328;
extern int func_0208cefc(void);

void func_0208f458(void)
{
    int r = func_0208cefc();
    data_021a6328 = r;
    switch (r) {
    case 0:
        return;
    case 0x40:
        data_021a6324 = 0x06894000;
        return;
    case 0x20:
        data_021a6324 = 0x06890000;
        return;
    }
}
