struct Self0229f160 {
    int f_0;
    char _pad[8];
    int f_c;
    int f_10;
};

extern void func_ov002_0229f1e8(void *self, int *out1, int *out0);

int func_ov002_0229f050(struct Self0229f160 *self, int arg1, int arg2) {
    int local1, local0;
    if (self->f_0 == 0)
        return 0;
    func_ov002_0229f1e8(self, &local1, &local0);
    int base1 = self->f_c * 8;
    if (arg1 < base1)
        goto fail;
    if (arg1 >= local1 + base1)
        goto fail;
    int base2 = self->f_10 * 8;
    if (arg2 < base2)
        goto fail;
    if (arg2 >= local0 + base2)
        goto fail;
    return 1;
fail:
    return 0;
}
