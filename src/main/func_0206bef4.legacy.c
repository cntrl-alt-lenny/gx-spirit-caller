extern int func_0209256c(void *a, void *b, int flag);
extern void func_0206bf60(void *b);

int func_0206bef4(void *a, void *b) {
    int flag;
    int result;
    flag = (b == 0) || ((*(signed char *)((char *)b + 0xd) & 1) != 0);
    result = func_0209256c(a, b, flag);
    if (result == 0) {
        func_0206bf60(b);
    }
    return (result != 0) ? 0 : -0x2a;
}
