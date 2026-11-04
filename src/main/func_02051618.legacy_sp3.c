extern char *func_020498f0(void);
extern int func_02062510(int);
extern int func_02062528(int);
extern int func_02067684(void *, int, int, int, int, int, int, void *, void *, void *, void *, void *, void *, int);
extern int func_0204aa0c(int);
extern void func_0206763c(int, void *);
extern int func_0206766c(int, void *);
extern int func_02067654(int, void *);
extern void func_020673dc(int);
extern void func_02049d70(void);
extern void func_02049e84(void);
extern void func_02049f38(void);
extern void func_02049f60(void);
extern int func_02049f6c(void);
extern void func_02049f74(void);
extern void func_0204a01c(void);
extern void func_0204a020(void);
extern void func_0204a024(void);

#define W(o) (*(int *)(func_020498f0() + (o)))

int func_02051618(int arg) {
    int i;
    int ret;
    if (W(0x10) != 0) {
        return 0;
    }
    W(0x200) = arg;
    for (i = 0; i < 5; i++) {
        char *a = func_020498f0();
        int x = func_02062510(*(int *)W(4));
        int y = func_02062528(*(int *)W(4));
        char *b = func_020498f0();
        ret = func_02067684(a + 0x10, x, y, *(int *)(b + 0x2f4), *(int *)(func_020498f0() + 0x2f8), 1, 1,
                            func_0204a024, func_0204a020, func_0204a01c, func_02049f74, func_02049f6c, func_02049f60, 0);
        (void)0;
        if (ret == 0) break;
        if (ret != 3 || i == 4) {
            func_0204aa0c(ret);
            return ret;
        }
    }
    *(int *)(func_020498f0() + 0x1c) = 0;
    *(short *)(func_020498f0() + 0x1a) = 0;
    func_0206763c(W(0x10), func_02049f38);
    func_0206766c(W(0x10), func_02049e84);
    func_02067654(W(0x10), func_02049d70);
    func_020673dc(W(0x10));
    return ret;
}
