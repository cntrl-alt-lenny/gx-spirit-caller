extern int data_021a4858;
extern void func_02094f74(int a, int b);

int func_020873fc(int mask)
{
    if (mask == 0) {
        return 1;
    }
    if (mask & data_021a4858) {
        return 0;
    }
    func_02094f74(mask, 0);
    data_021a4858 |= mask;
    return 1;
}
