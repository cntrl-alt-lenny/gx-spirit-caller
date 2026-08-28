extern int data_021a6548;

extern unsigned int func_02092a60(unsigned int idx);
extern void func_02092960(unsigned int idx, unsigned int v);
extern unsigned int func_02092974(unsigned int idx);
extern void func_0209294c(unsigned int idx, unsigned int v);

void func_02092c38(void) {
    unsigned int t;

    if (data_021a6548 != 0) {
        return;
    }
    data_021a6548 = 1;

    t = func_02092a60(0);
    func_02092960(0, t);
    t = func_02092974(0);
    func_0209294c(0, t);

    func_0209294c(2, 0);
    func_02092960(2, 0);

    t = func_02092a60(3);
    func_02092960(3, t);
    t = func_02092974(3);
    func_0209294c(3, t);

    t = func_02092a60(4);
    func_02092960(4, t);
    t = func_02092974(4);
    func_0209294c(4, t);

    t = func_02092a60(5);
    func_02092960(5, t);
    t = func_02092974(5);
    func_0209294c(5, t);

    t = func_02092a60(6);
    func_02092960(6, t);
    t = func_02092974(6);
    func_0209294c(6, t);
}
