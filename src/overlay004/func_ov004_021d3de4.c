extern char *func_ov004_021d38b4(void);
extern int func_02051ab0(int a0, int a1, int a2);
extern char data_ov004_02209f88[];
extern char data_ov004_0220e500[];
extern char data_0210594c[];

int func_ov004_021d3de4(int arg0) {
    int value;
    int flag;
    int other;
    int result;
    func_ov004_021d38b4();
    value = func_02051ab0(arg0, (int)data_ov004_02209f88, 1);
    if (*(int *)(data_ov004_0220e500 + 0xc9c) != 0 && value >= 1000)
        flag = 1;
    else
        flag = 0;
    value %= 1000;
    if (flag) return 50;
    other = *(unsigned short *)(data_0210594c + 0x58);
    result = 100 - (value - other >= 0 ? value - other : -(value - other)) * 10;
    if (value <= 10 && other <= 10) return result;
    if ((value - other < 0 ? -(value - other) : value - other) > 5) result = 0;
    return result;
}
