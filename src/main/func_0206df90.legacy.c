extern void *data_0219ece8;
extern int func_0206e010(void);
extern void func_0206de68(void *p);
extern int func_0206df54(void *p);
extern void func_0206dbbc(void);
extern int func_02074134(void);
extern void func_0207cbbc(int v);

int func_0206df90(void) {
    int r4;

    if (data_0219ece8 != 0) {
        r4 = func_0206e010();
        if (r4 == 0) {
            func_0206de68(data_0219ece8);
            if (func_0206df54(data_0219ece8) != 0) {
                data_0219ece8 = 0;
            }
            r4 = -26;
        }
        func_0206dbbc();
    } else {
        if (func_02074134() == 0) {
            r4 = -26;
        } else {
            func_0207cbbc(0);
            r4 = 0;
        }
    }
    return r4;
}
