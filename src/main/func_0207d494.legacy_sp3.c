extern void func_0207d6cc(void *, int, int);
extern void func_0207d610(void *, int, int);

void func_0207d494(void *p, int a1, int a2) {
    int size = a1;

    if (size == 0) {
        size = 1;
    }
    size = (size + 3) & ~3;
    if (a2 >= 0) {
        func_0207d6cc(p, size, a2);
    } else {
        func_0207d610(p, size, -a2);
    }
}
