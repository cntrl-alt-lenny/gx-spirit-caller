extern int func_0206df1c(void);
extern int func_0206e73c(void);

int func_0203dad4(void) {
    int r;

    if (func_0206df1c() != 0) {
        return 0;
    }
    r = func_0206e73c();
    if (r == 0 || r == -39) {
        return 1;
    }
    return 0;
}
