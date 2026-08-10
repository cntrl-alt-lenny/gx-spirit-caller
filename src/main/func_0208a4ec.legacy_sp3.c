extern void **func_02089328(void *a1);
extern void *func_02089024(void *x);
extern char *func_0208b000(void *r4, void *a2);
extern int func_0208a280(void *a0, int f9, int f4, int f8, void *p, void *r4, void *a1, void *a2);

int func_0208a4ec(void *a0, void *a1, void *a2) {
    void **tmp = func_02089328(a1);
    if (tmp == 0) {
        return 0;
    }
    void *x = func_02089024(*tmp);
    if (x == 0) {
        return 0;
    }
    char *p = func_0208b000(x, a2);
    if (p == 0) {
        return 0;
    }
    return func_0208a280(a0, *(unsigned char *)(p + 9), *(unsigned short *)(p + 4),
                          *(unsigned char *)(p + 8), p, x, a1, a2);
}
