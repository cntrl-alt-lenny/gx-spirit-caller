extern void func_0207cf0c(void *a0, void *a1);
extern void func_0207d044(void *a0, void *a1);
extern char data_021a4788[];
extern char data_021a477c[];

void func_020875a8(char *a0) {
    void *f0 = *(void **)a0;

    if (f0 != 0) {
        *(int *)f0 = 0;
        *(void **)a0 = 0;
    }

    void *f4 = *(void **)(a0 + 0x4);
    func_0207cf0c(f4, a0);
    *(void **)(a0 + 0x4) = 0;

    void *f8 = *(void **)(a0 + 0x8);
    if (f8 != 0) {
        func_0207d044((char *)f4 + 0xc, f8);
        f8 = *(void **)(a0 + 0x8);
        *(int *)((char *)f8 + 0xc) = 0;
        *(void **)(a0 + 0x8) = 0;
    }

    func_0207cf0c(data_021a4788, a0);
    func_0207d044(data_021a477c, a0);
    *(unsigned char *)(a0 + 0x2c) = 0;
}
