typedef struct {
    char pad_0[0x2c];
    unsigned char field_2c;
} Func02087954Obj;

extern void func_020876a8(void *p);
extern void func_0208afbc(void *p, int arg1, int arg2);
extern void func_020874f8(void *p, int flag);

void func_0208786c(Func02087954Obj *a0, int a1) {
    if (a0 == 0) {
        goto ret1;
    }
    if (a0->field_2c == 0) {
        goto ret2;
    }
    if (a1 == 0) {
        func_020876a8(a0);
        return;
    }
    func_0208afbc((char *)a0 + 0x1c, 0, a1);
    func_020874f8(a0, 0);
    a0->field_2c = 2;
    return;
ret1:
    return;
ret2:
    return;
}
