extern void *func_020498f0(void);
extern int func_02064f84(int a, int b, int c);
extern void func_02068d50(int a, int b, unsigned short c, int d);
extern int func_0204aaf4(void);
extern void func_02049990(void);
extern void func_02049d6c(void);
extern int func_02062510(int a);
extern int func_020657c0(int a, int b, int c, void *d, void *e, void *f);

int func_0204ec90(void *self) {
    int i;
    int r = 3;

    if (*(unsigned char *)self == 0) {
        void *g = func_020498f0();
        int x = func_02064f84(*(int *)((char *)self + 0x4), 0, 0);
        func_02068d50(*(int *)((char *)g + 0xe4), x,
                       *(unsigned short *)((char *)self + 0x2),
                       *(int *)((char *)self + 0x8));
        if (func_0204aaf4() != 0) {
            return 2;
        }
    }

    for (i = 0; i < 5; i++) {
        int v = func_02062510(*(int *)(*(int **)((char *)func_020498f0() + 0x4)));
        r = func_020657c0(v, *(int *)((char *)self + 0x8), *(unsigned char *)self,
                           func_02049d6c, func_02049990, self);
        if (r == 0) {
            return r;
        }
        if (r != 3) {
            return r;
        }
    }
    return r;
}
