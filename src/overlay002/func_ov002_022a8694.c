extern int data_ov002_022d0f2c[];
extern char data_ov002_022d1a9c[];
extern void func_0200612c(int *, int *);
extern int func_ov002_022ae430(void *, int, int);

int func_ov002_022a8694(void)
{
    int x;
    int y;

    if (data_ov002_022d0f2c[0xd0 / 4] == 1) {
        func_0200612c(&x, &y);
        if (func_ov002_022ae430(data_ov002_022d1a9c, x, y) >= 0) {
            return 0;
        }
    }
    return 1;
}
