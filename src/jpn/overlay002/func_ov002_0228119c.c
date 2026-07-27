extern void func_ov002_0227adf0(int a, int i, void *buf);
extern void func_ov002_0227ae40(int a, int i, void *buf);

int func_ov002_0228119c(int arg0, int arg1)
{
    char buf[0x2c];
    int i;
    int sum = 0;

    for (i = 0; i < 5; i++) {
        if (arg0 == arg1) {
            func_ov002_0227adf0(arg1, i, buf);
        } else {
            func_ov002_0227ae40(arg1, i, buf);
        }
        sum += *(int *)(buf + 0x14);
    }
    return sum;
}
