extern int func_0206df90(void);
extern int func_0206e7b0(void);

int func_0203ee94(void) {
    int r;

    if (func_0206df90() != 0) {
        return 0xb;
    }
    r = func_0206e7b0();
    if (r == 0 || r == -39) {
        return 9;
    }
    return 0xb;
}
