#pragma thumb on
extern char data_ov004_0229161c[];
extern void func_ov004_021dc2cc(int a, void *b, int c, int d, void *e, void *f, int g);
extern int func_ov004_021dbd6c(int x);
extern void func_ov004_021dbe68(void *p, int q, int n);
void func_ov004_021dc418(int a0, short *a1, int a2, short *a3, unsigned short *a4, int a5) {
    if (a0 == 1) {
        *a4 = 1;
        func_ov004_021dc2cc(a2, &a1[2], a3[0], a5, &a1[1], data_ov004_0229161c, 8);
        a1[0] = func_ov004_021dbd6c((unsigned short)a3[0]);
        a3[0] = a3[0] + 4;
    } else {
        func_ov004_021dbe68(a1, a2, a3[0]);
    }
}
