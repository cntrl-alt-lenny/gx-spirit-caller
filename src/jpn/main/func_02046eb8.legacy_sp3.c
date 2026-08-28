extern void *data_0219da0c;
extern int func_02045230(void);
extern void func_02046788(void);
extern void func_0204664c(int type, void *obj);
extern void func_020513b8(int a0, int a1, void (*fn)(void), int a2, int a3, int a4);
extern void func_020461ac(void);

int func_02046eb8(int a0, int a1, int a2, int a3, int a4, int a5) {
    if (func_02045230() != 0) {
        goto fail;
    }
    if (*(int *)((char *)data_0219da0c + 0x24) == 3) {
        goto success;
    }
fail:
    return 0;
success:
    func_02046788();
    *(int *)((char *)data_0219da0c + 0x80) = a2;
    {
        void *v = data_0219da0c;
        *(int *)((char *)v + 0x84) = a3;
        func_0204664c(5, v);
    }
    func_020513b8((a0 - 1) & 0xff, a1, func_020461ac, 0, a4, a5);
    return 1;
}
