extern int func_02044228(unsigned char *p);
extern void func_02094688(const void *src, void *dst, int n);

int func_02044254(const void *a, const void *b) {
    unsigned int x;
    unsigned int y;
    if (func_02044228((unsigned char *)a) == 0) {
        return 0;
    }
    func_02094688(a, &x, 4);
    func_02094688(b, &y, 4);
    if ((x | y) == 0xfffffffe) {
        return 0;
    }
    return (x & ~y) != 0;
}
