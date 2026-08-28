extern char data_021a516c[];
extern void func_0208af70(void *p);
extern int func_0208af58(void *p);
extern void func_0208878c(void);
extern int func_0208af88(void *p);
extern void func_02094e20(void *a, int b, int c);

void func_02088bd8(void) {
    char *d = data_021a516c;
    char *p;
    int v;

    if (*(int *)d == 0) return;
    if (*(int *)(d + 4) != 0) return;

    p = d + 0x3c;
    func_0208af70(p);

    if (*(int *)(d + 0x4c) != 0) {
        if (func_0208af58(p) != 0) {
            func_0208878c();
            return;
        }
    }

    v = func_0208af88(p) >> 8;
    if (v == *(int *)(d + 0x50)) return;

    func_02094e20(*(void **)(d + 0x24), v, 0);
    *(int *)(d + 0x50) = v;
}
