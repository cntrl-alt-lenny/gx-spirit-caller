extern char data_021a524c[];
extern void func_0208b058(void *p);
extern int func_0208b040(void *p);
extern void func_02088874(void);
extern int func_0208b070(void *p);
extern void func_02094f14(void *a, int b, int c);

void func_02088cc0(void) {
    char *d = data_021a524c;
    char *p;
    int v;

    if (*(int *)d == 0) return;
    if (*(int *)(d + 4) != 0) return;

    p = d + 0x3c;
    func_0208b058(p);

    if (*(int *)(d + 0x4c) != 0) {
        if (func_0208b040(p) != 0) {
            func_02088874();
            return;
        }
    }

    v = func_0208b070(p) >> 8;
    if (v == *(int *)(d + 0x50)) return;

    func_02094f14(*(void **)(d + 0x24), v, 0);
    *(int *)(d + 0x50) = v;
}
