typedef struct {
    char pad[0xc];
    int **field_c;
} T_02065974;

extern int func_02054c0c(int a0);
extern T_02065974 *func_0206ebe8(int a0);

int func_02065974(int a0) {
    int result;
    T_02065974 *p;
    result = func_02054c0c(a0);
    if (result != -1) {
        return result;
    }
    p = func_0206ebe8(a0);
    if (p == 0) {
        return 0;
    }
    return **(p->field_c);
}
