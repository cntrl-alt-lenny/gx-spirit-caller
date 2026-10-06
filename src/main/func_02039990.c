typedef struct {
    unsigned int id : 24;
    unsigned int flags : 8;
} ref_02039990_t;

extern void *func_02089024(int id);
extern void func_0209614c(void *a, int b, void *c);

int func_02039990(int *a, ref_02039990_t *b) {
    void *pa;
    void *pb;

    pa = func_02089024(*a);
    if (pa == 0) {
        return 0;
    }
    pb = func_02089024(b->id);
    if (pb == 0) {
        return 0;
    }
    func_0209614c(pa, 0, pb);
    return 1;
}
