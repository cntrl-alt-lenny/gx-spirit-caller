extern int func_02060c9c(void *a0, void *a1);
extern int func_020ace00(int a0);
extern int func_02060b84(int a0, int a1, int a2);
extern int *func_020540d0(void *a0, int a1);
extern int func_02060604(int a0, int a1, int a2, int a3, int a4);
extern char data_021013b8[];
extern char data_021013d8[];
extern void *data_0219e518;

int func_02060a3c(void *a0) {
    int v1 = func_020ace00(func_02060c9c(a0, data_021013d8 + 0x4));
    int v2 = func_020ace00(func_02060c9c(a0, data_021013b8));
    int retval = func_02060b84(3, v2, 0);

    if (retval == -1) {
        return -1;
    }

    int *obj = func_020540d0(data_0219e518, retval);
    obj[2] = v1;
    return func_02060604(retval, v1 > 0, 0, 0, 0);
}
