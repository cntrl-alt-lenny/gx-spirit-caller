/* func_0205ff60: p = *a0; func_0206043c(p, a2, 0x100); p->f418 = a1. SP3 tier
 * (1.2/sp3). */
extern void func_0206043c(void *, int, int);
void func_0205ff60(int *a0, int a1, int a2){
    int *p = (int *)*a0;
    func_0206043c(p, a2, 0x100);
    *(int *)((char *)p + 0x418) = a1;
}
