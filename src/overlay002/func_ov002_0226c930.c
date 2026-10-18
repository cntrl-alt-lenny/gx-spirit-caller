extern char data_ov002_022d016c[];
extern char data_ov002_022d0e6c[];
extern int func_ov002_021bf294(int a, int b, int c, int d, int e);

int func_ov002_0226c930(int a, int b, int c)
{
    int sum;
    if (a == *(int *)(data_ov002_022d016c + 0xd94)) {
        sum = b + c;
        if (sum <= 4) {
            if (func_ov002_021bf294(1 - a, *(unsigned short *)(data_ov002_022d0e6c + 0xa2), a, sum, 1) != 0) {
                return 0x800;
            }
        }
    }
    return 0;
}
