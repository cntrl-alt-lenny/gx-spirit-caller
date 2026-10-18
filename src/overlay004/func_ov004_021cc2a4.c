struct State { char pad54[0x54]; int value; char pad1c[0x1c]; int flag; };
extern void func_0201cd1c(int a, short *b, int c, int d);
extern int func_02037208(int a, int b, int c, int d);
extern struct State data_ov004_0220b500;
void func_ov004_021cc2a4(void) {
    short x = 19;
    func_0201cd1c(2, &x, 2, 19);
    data_ov004_0220b500.flag = 0;
    data_ov004_0220b500.value--;
    func_02037208(66, -1, 0, 1);
}