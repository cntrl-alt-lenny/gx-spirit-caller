extern int data_ov002_022cd524[];
extern char data_ov002_022d016c[];
extern int func_ov002_022974bc(int a, int b);
extern int func_ov002_02297d68(int a);
extern int func_ov002_02285d68(int a);
extern int func_ov002_0229979c(int a, int b, int c);

int func_ov002_02299984(void)
{
    int a = *(int *)(data_ov002_022d016c + 0xcec);
    int i;
    switch (data_ov002_022cd524[2]) {
    case 0:
        if (*(unsigned int *)(data_ov002_022d016c + 0xcf8) >= 3) return 1;
        if (func_ov002_022974bc(a, 0)) return 0;
        data_ov002_022cd524[2]++;
    case 1:
        if (func_ov002_02297d68(a)) return 0;
        data_ov002_022cd524[2]++;
    case 2:
        func_ov002_02285d68(a);
        for (i = 0; i <= 4; i++) {
            if (func_ov002_0229979c(a, i, 0)) return 0;
        }
        data_ov002_022cd524[2]++;
    case 3:
        if (func_ov002_02297d68(a)) return 0;
        data_ov002_022cd524[2]++;
    case 4:
        return 1;
    default:
        return 1;
    }
}
