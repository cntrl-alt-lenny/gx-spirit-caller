extern void func_02093814(int unused0);
extern int func_02095344(void);
extern void func_02095484(int dummy, void *arg1);
extern int func_0209640c(int bit, int idx);
extern void func_02096434(int slot, int value);

void func_02095418(void) {
    func_02096434(7, (int)func_02095484);
    if (func_02095344() == 0) {
        return;
    }
    if (func_0209640c(7, 1) != 0) {
        return;
    }
    do {
        func_02093814(100);
    } while (func_0209640c(7, 1) == 0);
}
