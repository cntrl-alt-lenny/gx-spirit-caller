extern int func_02053688(int a0);
extern int func_020536a0(int a0);

int func_02053650(int a0) {
    int result;
    if (func_02053688(a0) == 3) {
        result = (func_020536a0(a0) & 4) == 4;
    } else {
        result = 0;
    }
    return result;
}
