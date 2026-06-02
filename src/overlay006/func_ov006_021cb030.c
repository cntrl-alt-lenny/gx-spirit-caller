/* func_ov006_021cb030: clear an 80-byte table, lazily allocate up to 5 empty
 * handle slots, then run the post pass; return 1. */
extern void Fill32(int v, void *dst, int n);
extern int  func_02006c0c(void *p, int b, int c);
extern void func_ov006_021cb14c(int *arr, int x);
extern char  data_ov006_0225e138[];
extern void *data_ov006_021cf0c4[];
int func_ov006_021cb030(int *arr) {
    int i;
    Fill32(0, data_ov006_0225e138, 80);
    for (i = 0; i < 5; i++)
        if (arr[i] == 0)
            arr[i] = func_02006c0c(data_ov006_021cf0c4[i], 4, 0);
    func_ov006_021cb14c(arr, 15);
    return 1;
}
