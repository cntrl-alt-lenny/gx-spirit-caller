extern void *func_02089240(void *e);
extern void *func_02088f3c(void *p);
extern void *func_0208af18(void *result2, void *f);
extern int func_0208a198(void *a, int b, int c, int d, void *result3, void *result2, void *e, void *f);

int func_0208a358(void *a, int b, int c, int d, void *e, void *f) {
    void *r1, *result2, *result3;

    r1 = func_02089240(e);
    if (r1 == 0) return 0;

    result2 = func_02088f3c(*(void **)r1);
    if (result2 == 0) return 0;

    result3 = func_0208af18(result2, f);
    if (result3 == 0) return 0;

    if (d < 0) d = *((unsigned char *)result3 + 8);
    if (c < 0) c = *(unsigned short *)((char *)result3 + 4);
    if (b < 0) b = *((unsigned char *)result3 + 9);

    return func_0208a198(a, b, c, d, result3, result2, e, f);
}
