extern void *data_0219ecc8;
extern int func_02054614(void *p);
extern void func_02054684(void *a0);

void func_02068bb8(void) {
    if (data_0219ecc8 == 0) {
        return;
    }
    if (func_02054614(data_0219ecc8) != 0) {
        return;
    }
    func_02054684(data_0219ecc8);
    data_0219ecc8 = 0;
}
