extern char data_ov002_022d016c[];
extern int func_ov002_021b9ecc(int a, int b);
extern void func_ov002_021e2d94(int a, int b, int c, int d);

int func_ov002_02256a50(void)
{
    int p;
    int j;
    int i;
    for (i = 0; i < 2; i++) {
        p = *(int *)(data_ov002_022d016c + 0xcec) ^ i;
        for (j = 0; j <= 4; j++) {
            if (func_ov002_021b9ecc(p, j) == 0x1744) {
                func_ov002_021e2d94(p, j, 5, 0);
            }
        }
    }
    return 0;
}
