extern char data_ov002_022cd314[];

extern int  func_ov002_021c19f0(int a, int b);
extern int  func_ov002_021bad9c(int a, int b, int c);
extern void func_ov002_021df590(int a, int b);
extern void func_ov002_021e1304(int a, int b, int c);
extern int  func_ov002_021bb184(int a, int b, int c);
extern void func_ov002_021df690(int a, int b);

int func_ov002_0225c010(int arg0) {
    int f4 = *(int *)(data_ov002_022cd314 + 0x4);
    int ret = func_ov002_021c19f0(arg0, *(int *)(data_ov002_022cd314 + 0x1c));

    if (*(int *)(data_ov002_022cd314 + 0x10) != 0) {
        return 1;
    }
    *(int *)(data_ov002_022cd314 + 0x10) = 1;

    if ((ret & 2) <= 0) {
        int r = func_ov002_021bad9c(f4, 0x131d, -1);
        if (r > 0) {
            func_ov002_021df590(f4, 0x131d);
            func_ov002_021e1304(arg0, r, 1);
        }
    }

    {
        int i;
        int n = func_ov002_021bb184(0x1320, arg0, ret);
        if (n > 0) {
            func_ov002_021df590(-1, 0x1320);
            for (i = 0; i < n; i++) {
                func_ov002_021df690(arg0, 0x1f4);
            }
        }
    }

    return 1;
}
