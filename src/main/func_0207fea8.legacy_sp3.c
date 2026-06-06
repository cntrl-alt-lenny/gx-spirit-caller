/* func_0207fea8: p = func_0207fed4(a0); p->f24 = -1; p->f28 = a1; p->f2c = a2.
 * SP3 tier (1.2/sp3). */
extern int *func_0207fed4(int);
void func_0207fea8(int a0, int a1, int a2){
    int *p = func_0207fed4(a0);
    p[9] = -1;
    p[10] = a1;
    p[11] = a2;
}
