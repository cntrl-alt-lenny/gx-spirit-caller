extern void **func_02089240(void *a1);
extern void *func_02088f3c(void *x);
extern char *func_0208af18(void *r4, void *a2);
extern int func_0208a198(void *a0, int f9, int f4, int f8, void *p, void *r4, void *a1, void *a2);

int func_0208a404(void *a0, void *a1, void *a2) {
    void **tmp = func_02089240(a1);
    if (tmp == 0) {
        return 0;
    }
    void *x = func_02088f3c(*tmp);
    if (x == 0) {
        return 0;
    }
    char *p = func_0208af18(x, a2);
    if (p == 0) {
        return 0;
    }
    return func_0208a198(a0, *(unsigned char *)(p + 9), *(unsigned short *)(p + 4),
                          *(unsigned char *)(p + 8), p, x, a1, a2);
}
