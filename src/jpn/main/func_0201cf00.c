/* func_0201cf00: if a1, forward to func_0201ca60(a1, a2, flag) where flag =
 * (a1->f0 >> 8) == 0xff. (a0 unused.) */
extern void func_0201ca60(void *, int, int);
void func_0201cf00(int a0, unsigned short *a1, int a2){
    int flag;
    if (a1 == 0) return;
    flag = ((a1[0] >> 8) == 0xff) ? 1 : 0;
    func_0201ca60(a1, a2, flag);
}
