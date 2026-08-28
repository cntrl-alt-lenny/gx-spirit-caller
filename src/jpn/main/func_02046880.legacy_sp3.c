extern void *data_0219da0c;
extern int func_02045948(int a);
extern int func_02064f10(int a, int b, int c);
extern int func_0206277c(void *a, int b, int c, int d, void *fn);
extern int func_020463f0(int a);
extern void func_02062728(void *a, void *fn);
extern void func_02062494(void *a, void *fn);
extern void func_02045c10(void);
extern void func_020503dc(void);
extern void func_0205063c(void);

int func_02046880(void) {
    void *p1;
    int a;
    int masked;
    int r;
    int result;

    if (*(void **)data_0219da0c != 0) {
        return 0;
    }

    a = func_02045948(0x4000);
    masked = (unsigned short)(a + 0xc000);
    p1 = data_0219da0c;
    r = func_02064f10(0, masked, 0);
    result = func_0206277c(data_0219da0c, r,
                            *(int *)((char *)p1 + 0x14),
                            *(int *)((char *)p1 + 0x18),
                            func_02045c10);

    if (func_020463f0(result) != 0) {
        return result;
    }

    func_02062728(*(void **)data_0219da0c, func_020503dc);
    func_02062494(*(void **)data_0219da0c, func_0205063c);
    return result;
}
