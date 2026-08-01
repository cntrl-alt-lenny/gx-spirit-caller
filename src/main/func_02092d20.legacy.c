extern int data_021a6628;

extern unsigned int func_02092b48(unsigned int idx);
extern void func_02092a48(unsigned int idx, unsigned int v);
extern unsigned int func_02092a5c(unsigned int idx);
extern void func_02092a34(unsigned int idx, unsigned int v);

void func_02092d20(void) {
    unsigned int t;

    if (data_021a6628 != 0) {
        return;
    }
    data_021a6628 = 1;

    t = func_02092b48(0);
    func_02092a48(0, t);
    t = func_02092a5c(0);
    func_02092a34(0, t);

    func_02092a34(2, 0);
    func_02092a48(2, 0);

    t = func_02092b48(3);
    func_02092a48(3, t);
    t = func_02092a5c(3);
    func_02092a34(3, t);

    t = func_02092b48(4);
    func_02092a48(4, t);
    t = func_02092a5c(4);
    func_02092a34(4, t);

    t = func_02092b48(5);
    func_02092a48(5, t);
    t = func_02092a5c(5);
    func_02092a34(5, t);

    t = func_02092b48(6);
    func_02092a48(6, t);
    t = func_02092a5c(6);
    func_02092a34(6, t);
}
