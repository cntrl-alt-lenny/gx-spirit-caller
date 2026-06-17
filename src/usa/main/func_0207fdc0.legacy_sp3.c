/* func_0207fdc0: p = func_0207fdec(a0); p->f24 = -1; p->f28 = a1; p->f2c = a2.
 * SP3 tier (1.2/sp3). */
extern int *func_0207fdec(int);
void func_0207fdc0(int a0, int a1, int a2){
    int *p = func_0207fdec(a0);
    p[9] = -1;
    p[10] = a1;
    p[11] = a2;
}
