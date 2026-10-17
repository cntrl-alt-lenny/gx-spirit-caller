typedef struct { char p[0x8f8]; unsigned int pad : 10; unsigned int b : 1; unsigned int rest : 21; } W;
extern W *GetSystemWork(void);
extern void func_020190c0(void);
extern int func_0201a454(void);
extern void func_0200a26c(int);
int func_0201a498(void) {
    W *w = GetSystemWork();
    int r;
    func_020190c0();
    r = func_0201a454();
    if (r != 0) {
        if (w->b == 0) {
            *(unsigned int *)((char *)w + 0x8f8) |= 0x400;
            func_0200a26c(5);
        }
    }
    return r;
}
