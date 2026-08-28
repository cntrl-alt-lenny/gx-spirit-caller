extern void *func_0204987c(void);
extern int func_02064f10(int a, int b, int c);
extern void func_02068cdc(int a, int b, unsigned short c, int d);
extern int func_0204aa80(void);
extern void func_0204991c(void);
extern void func_02049cf8(void);
extern int func_0206249c(int a);
extern int func_0206574c(int a, int b, int c, void *d, void *e, void *f);

int func_0204ec1c(void *self) {
    int i;
    int r = 3;

    if (*(unsigned char *)self == 0) {
        void *g = func_0204987c();
        int x = func_02064f10(*(int *)((char *)self + 0x4), 0, 0);
        func_02068cdc(*(int *)((char *)g + 0xe4), x,
                       *(unsigned short *)((char *)self + 0x2),
                       *(int *)((char *)self + 0x8));
        if (func_0204aa80() != 0) {
            return 2;
        }
    }

    for (i = 0; i < 5; i++) {
        int v = func_0206249c(*(int *)(*(int **)((char *)func_0204987c() + 0x4)));
        r = func_0206574c(v, *(int *)((char *)self + 0x8), *(unsigned char *)self,
                           func_02049cf8, func_0204991c, self);
        if (r == 0) {
            return r;
        }
        if (r != 3) {
            return r;
        }
    }
    return r;
}
