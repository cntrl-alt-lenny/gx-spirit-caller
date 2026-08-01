extern char data_ov002_022cd3f4[];

extern int  func_ov002_021c1ad0(int a, int b);
extern int  func_ov002_021bae7c(int a, int b, int c);
extern void func_ov002_021df680(int a, int b);
extern void func_ov002_021e13f4(int a, int b, int c);
extern int  func_ov002_021bb264(int a, int b, int c);
extern void func_ov002_021df780(int a, int b);

int func_ov002_0225c0f8(int arg0) {
    int f4 = *(int *)(data_ov002_022cd3f4 + 0x4);
    int ret = func_ov002_021c1ad0(arg0, *(int *)(data_ov002_022cd3f4 + 0x1c));

    if (*(int *)(data_ov002_022cd3f4 + 0x10) != 0) {
        return 1;
    }
    *(int *)(data_ov002_022cd3f4 + 0x10) = 1;

    if ((ret & 2) <= 0) {
        int r = func_ov002_021bae7c(f4, 0x131d, -1);
        if (r > 0) {
            func_ov002_021df680(f4, 0x131d);
            func_ov002_021e13f4(arg0, r, 1);
        }
    }

    {
        int i;
        int n = func_ov002_021bb264(0x1320, arg0, ret);
        if (n > 0) {
            func_ov002_021df680(-1, 0x1320);
            for (i = 0; i < n; i++) {
                func_ov002_021df780(arg0, 0x1f4);
            }
        }
    }

    return 1;
}
