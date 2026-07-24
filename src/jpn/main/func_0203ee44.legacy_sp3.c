extern int func_0206df1c(void);
extern int func_0206e73c(void);

int func_0203ee44(void) {
    int r;

    if (func_0206df1c() != 0) {
        return 0xb;
    }
    r = func_0206e73c();
    if (r == 0 || r == -39) {
        return 9;
    }
    return 0xb;
}
