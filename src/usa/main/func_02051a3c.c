extern char *func_0204987c(void);
extern int func_02045230(void);
extern int func_02068c54(int a, int b);
extern int func_020689ac(int a, int b, int c);

int func_02051a3c(int a0, int a1, int a2) {
    if (func_0204987c() == 0 || func_02045230() != 0) {
        return a2;
    }
    {
        char *h = func_0204987c();
        int r = func_02068c54(*(int *)(h + 0xe4), a0);
        if (r != 0) {
            a2 = func_020689ac(r, a1, a2);
        }
    }
    return a2;
}
