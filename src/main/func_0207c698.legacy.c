extern void *func_0207b538(void *a, int b);
extern int func_0207c4ec(void *field4);
extern int func_0207c5b4();
extern int func_0207c570();
extern void func_02094550(void *a, void *out, int flag);
extern void func_0207c3b0(void *p);

void func_0207c698(char *a, int b) {
    void *result;
    void *r6;

    result = func_0207b538(a, b);
    if (result == 0) return;

    if (*(unsigned char *)((char *)result + 0x226a) != 0) return;
    if (*(unsigned short *)(a + 0x3c) != 0) return;

    r6 = (void *)func_0207c4ec(a + 4);
    if (r6 == 0) {
        r6 = (void *)func_0207c5b4();
    }

    if (r6 == 0) {
        if (*(int *)((char *)result + 0x2278) == 1) {
            r6 = (void *)func_0207c570();
        }
    }

    if (r6 == 0) return;

    *(unsigned short *)((char *)r6 + 2) = (unsigned short)b;
    func_02094550(a, (char *)r6 + 0x10, 0xc0);
    func_0207c3b0(r6);
}
