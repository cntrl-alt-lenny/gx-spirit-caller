extern int func_02053614(int a0);
extern int func_0205362c(int a0);

int func_020535dc(int a0) {
    int result;
    if (func_02053614(a0) == 3) {
        result = (func_0205362c(a0) & 4) == 4;
    } else {
        result = 0;
    }
    return result;
}
