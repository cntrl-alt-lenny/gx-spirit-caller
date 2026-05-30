/* func_0206fc2c: Family G conditional fill (brief 268 16/16). */
extern void func_020945f4(void *ptr, int val, unsigned count);
int func_0206fc2c(int a0, unsigned a1, int a2, unsigned a3) {
    if (a3 < a1) {
        unsigned n = a1 - a3;
        func_020945f4((void *)a2, a0, n);
        a2 += n;
    }
    return a2;
}
