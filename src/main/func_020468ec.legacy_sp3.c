extern void *data_0219daec;
extern int func_020459f0(int a);
extern int func_02064f84(int a, int b, int c);
extern int func_020627f0(void *a, int b, int c, int d, void *fn);
extern int func_02046498(int a);
extern void func_0206279c(void *a, void *fn);
extern void func_02062508(void *a, void *fn);
extern void func_02045cb8(void);
extern void func_02050450(void);
extern void func_020506b0(void);

int func_020468ec(void) {
    void *p1;
    int a;
    int masked;
    int r;
    int result;

    if (*(void **)data_0219daec != 0) {
        return 0;
    }

    a = func_020459f0(0x4000);
    masked = (unsigned short)(a + 0xc000);
    p1 = data_0219daec;
    r = func_02064f84(0, masked, 0);
    result = func_020627f0(data_0219daec, r,
                            *(int *)((char *)p1 + 0x14),
                            *(int *)((char *)p1 + 0x18),
                            func_02045cb8);

    if (func_02046498(result) != 0) {
        return result;
    }

    func_0206279c(*(void **)data_0219daec, func_02050450);
    func_02062508(*(void **)data_0219daec, func_020506b0);
    return result;
}
