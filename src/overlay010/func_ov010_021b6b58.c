typedef struct { short f0, f2, f4, f6; } Input;
extern char data_ov010_021b9884[];
extern char data_ov010_021b9890[];
/* The original passes a handle although the existing C definition takes void. */
extern int func_ov005_021ac9c8(int h);
extern int func_020b3870(int a, int b);
extern void func_ov010_021b3a14(void *p, int v);
extern int func_02037208(int a0, int r1, int r2, int r3);
void func_ov010_021b6b58(int a0, Input *a1) {
    char *d = data_ov010_021b9890;
    int n = func_ov005_021ac9c8(*(int *)(data_ov010_021b9884 + 0x94));
    int v = 0;
    if (n > 0) v = func_020b3870(a1->f2 - 0x24, n);
    if (*(int *)d != 2) return;
    if (a1->f6 - a1->f2 < n) return;
    if (v == *(int *)(d + 0xe8)) {
        *(int *)(d + 0x358) |= 0x10;
        return;
    }
    func_ov010_021b3a14(d + 0x8c, v);
    *(int *)(d + 4) = a0;
    func_02037208(0x38, -1, 0, 1);
}
