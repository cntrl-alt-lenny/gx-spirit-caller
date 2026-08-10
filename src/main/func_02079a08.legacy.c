extern void func_020945f4(void *dst, int val, int n);
extern int func_02079e20(void *p, int n);
extern void func_02079ac4(void *dst, int product, int idx, int n);

void func_02079a08(void *arg0, unsigned short *arg1, unsigned short *arg2, int arg3) {
    int i, j;
    int v1, v2;

    func_020945f4(arg0, 0, arg3 * 2);
    v1 = func_02079e20(arg1, arg3);
    v2 = func_02079e20(arg2, arg3);
    for (i = 0; i < v2; i++) {
        int bound = arg3 - i;
        for (j = 0; j < v1 && j < bound; j++) {
            func_02079ac4(arg0, arg1[j] * arg2[i], i + j, arg3);
        }
    }
}
