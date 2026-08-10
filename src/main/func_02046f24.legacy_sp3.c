extern void *data_0219daec;
extern int func_02045280(void);
extern void func_020467f4(void);
extern void func_020466f4(int type, void *obj);
extern void func_0205142c(int a0, int a1, void (*fn)(void), int a2, int a3, int a4);
extern void func_02046254(void);

int func_02046f24(int a0, int a1, int a2, int a3, int a4, int a5) {
    if (func_02045280() != 0) {
        goto fail;
    }
    if (*(int *)((char *)data_0219daec + 0x24) == 3) {
        goto success;
    }
fail:
    return 0;
success:
    func_020467f4();
    *(int *)((char *)data_0219daec + 0x80) = a2;
    {
        void *v = data_0219daec;
        *(int *)((char *)v + 0x84) = a3;
        func_020466f4(5, v);
    }
    func_0205142c((a0 - 1) & 0xff, a1, func_02046254, 0, a4, a5);
    return 1;
}
