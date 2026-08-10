extern char *func_0207b538(void);
extern int func_0207c990(void *a0);
extern int func_0209f720(void *a0, void *a1, void *a2, int a3);
extern void func_0207c934(void *a0);
extern int func_0207c9dc(void);
extern char data_021a089c[];

void func_0207cca8(void) {
    char *p = func_0207b538();

    if (p == 0) {
        return;
    }
    if (*(int *)(p + 0x2260) != 9) {
        return;
    }
    if (*(unsigned char *)(p + 0x226b) == 1) {
        return;
    }
    if (func_0207c990(data_021a089c) == 0) {
        return;
    }
    if (func_0209f720((void *)func_0207c9dc, p + 0x2144, p + 0xf00, 0) == 2) {
        return;
    }
    func_0207c934(data_021a089c);
}
