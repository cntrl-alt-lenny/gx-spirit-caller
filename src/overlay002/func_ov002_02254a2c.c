extern int func_ov002_021bb068(int id);
extern void func_ov002_021df680(int a, int id);
extern void func_ov002_021df780(int a, int b);

void func_ov002_02254a2c(int a)
{
    int i;
    int n;

    n = func_ov002_021bb068(0x132c);
    if (n <= 0) {
        return;
    }
    func_ov002_021df680(-1, 0x132c);
    for (i = 0; i < n; i++) {
        func_ov002_021df780(a, 500);
    }
}
