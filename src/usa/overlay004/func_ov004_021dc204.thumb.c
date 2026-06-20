#pragma thumb on
extern char data_ov004_022913bc[];
extern void func_ov004_021dc0b8(int a, void *b, int c, int d, void *e, void *f, int g);
extern int func_ov004_021dbb58(int x);
extern void func_ov004_021dbc54(void *p, int q, int n);
void func_ov004_021dc204(int a0, short *a1, int a2, short *a3, unsigned short *a4, int a5) {
    if (a0 == 1) {
        *a4 = 1;
        func_ov004_021dc0b8(a2, &a1[2], a3[0], a5, &a1[1], data_ov004_022913bc, 8);
        a1[0] = func_ov004_021dbb58((unsigned short)a3[0]);
        a3[0] = a3[0] + 4;
    } else {
        func_ov004_021dbc54(a1, a2, a3[0]);
    }
}
