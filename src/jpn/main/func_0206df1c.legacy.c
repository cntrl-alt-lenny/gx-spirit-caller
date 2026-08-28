extern void *data_0219ec08;
extern int func_0206df9c(void);
extern void func_0206ddf4(void *p);
extern int func_0206dee0(void *p);
extern void func_0206db48(void);
extern int func_0207404c(void);
extern void func_0207cad4(int v);

int func_0206df1c(void) {
    int r4;

    if (data_0219ec08 != 0) {
        r4 = func_0206df9c();
        if (r4 == 0) {
            func_0206ddf4(data_0219ec08);
            if (func_0206dee0(data_0219ec08) != 0) {
                data_0219ec08 = 0;
            }
            r4 = -26;
        }
        func_0206db48();
    } else {
        if (func_0207404c() == 0) {
            r4 = -26;
        } else {
            func_0207cad4(0);
            r4 = 0;
        }
    }
    return r4;
}
