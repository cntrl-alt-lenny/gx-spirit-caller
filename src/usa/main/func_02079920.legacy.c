extern void func_02094500(void *dst, int val, int n);
extern int func_02079d38(void *p, int n);
extern void func_020799dc(void *dst, int product, int idx, int n);

void func_02079920(void *arg0, unsigned short *arg1, unsigned short *arg2, int arg3) {
    int i, j;
    int v1, v2;

    func_02094500(arg0, 0, arg3 * 2);
    v1 = func_02079d38(arg1, arg3);
    v2 = func_02079d38(arg2, arg3);
    for (i = 0; i < v2; i++) {
        int bound = arg3 - i;
        for (j = 0; j < v1 && j < bound; j++) {
            func_020799dc(arg0, arg1[j] * arg2[i], i + j, arg3);
        }
    }
}
