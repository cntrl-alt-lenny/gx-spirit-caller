/* func_ov006_021c4f78: clear a scratch buffer, reset two slots, stash the
 * handle arg, and hand off to the builder; return 1. */
extern void Fill32(int v, void *dst, int n);
extern void func_ov006_021c59f4(int *a);
extern char data_ov006_0225db14[];
int func_ov006_021c4f78(int *a, int handle) {
    Fill32(0, data_ov006_0225db14, 560);
    a[15] = 0;
    a[16] = 0;
    a[21] = handle;
    func_ov006_021c59f4(a);
    return 1;
}
