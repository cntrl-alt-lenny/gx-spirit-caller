extern void func_0207ae40(void);
extern void func_0207af50(int a);
extern void func_0207b054(int a, int b, int c, int d);

void func_0207a6ec(void *self) {
    switch (*(unsigned short *)((char *)self + 0x2)) {
    case 0:
        func_0207af50(3);
        func_0207b054(0, 0, 0, 0x783);
        return;
    case 1:
        func_0207ae40();
        return;
    case 2:
    case 3:
    case 4:
    default:
        func_0207af50(0xb);
        func_0207b054(7, 0, 0, 0x793);
        return;
    }
}
