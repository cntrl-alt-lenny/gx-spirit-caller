extern void func_0207af28(void);
extern void func_0207b038(int a);
extern void func_0207b13c(int a, int b, int c, int d);

void func_0207a7d4(void *self) {
    switch (*(unsigned short *)((char *)self + 0x2)) {
    case 0:
        func_0207b038(3);
        func_0207b13c(0, 0, 0, 0x783);
        return;
    case 1:
        func_0207af28();
        return;
    case 2:
    case 3:
    case 4:
    default:
        func_0207b038(0xb);
        func_0207b13c(7, 0, 0, 0x793);
        return;
    }
}
