extern void func_0207d5e4(void *, int, int);
extern void func_0207d528(void *, int, int);

void func_0207d3ac(void *p, int a1, int a2) {
    int size = a1;

    if (size == 0) {
        size = 1;
    }
    size = (size + 3) & ~3;
    if (a2 >= 0) {
        func_0207d5e4(p, size, a2);
    } else {
        func_0207d528(p, size, -a2);
    }
}
