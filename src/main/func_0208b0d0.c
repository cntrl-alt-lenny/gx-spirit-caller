typedef struct {
    volatile int f0;
    volatile int f4;
    volatile int f8;
    volatile int fc;
} T_0208b0d0;

void func_0208b0d0(T_0208b0d0 *p) {
    p->f4 = 0;
    p->f0 = p->f4;
    p->fc = 0;
    p->f8 = p->fc;
}
