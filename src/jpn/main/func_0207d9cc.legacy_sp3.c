extern void func_0207db10(void *, int, int);
extern void func_0207daa4(void *, int, int);

void func_0207d9cc(char *p, int a1, int a2) {
    int size = a1;
    char *q = p + 0x24;

    if (size == 0) {
        size = 1;
    }
    size = (size + 3) & ~3;
    if (a2 >= 0) {
        func_0207db10(q, size, a2);
    } else {
        func_0207daa4(q, size, -a2);
    }
}
