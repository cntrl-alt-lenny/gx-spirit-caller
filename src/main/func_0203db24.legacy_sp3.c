extern int func_0206df90(void);
extern int func_0206e7b0(void);

int func_0203db24(void) {
    int r;

    if (func_0206df90() != 0) {
        return 0;
    }
    r = func_0206e7b0();
    if (r == 0 || r == -39) {
        return 1;
    }
    return 0;
}
