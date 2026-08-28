extern int func_02092484(void *a, void *b, int flag);
extern void func_0206beec(void *b);

int func_0206be80(void *a, void *b) {
    int flag;
    int result;
    flag = (b == 0) || ((*(signed char *)((char *)b + 0xd) & 1) != 0);
    result = func_02092484(a, b, flag);
    if (result == 0) {
        func_0206beec(b);
    }
    return (result != 0) ? 0 : -0x2a;
}
