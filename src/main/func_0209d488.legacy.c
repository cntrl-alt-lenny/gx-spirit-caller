extern int func_02096358(int a, int b, int c);
extern void WaitByLoop(int count);

void func_0209d488(int a, int count) {
    if (func_02096358(14, a, 0) == 0) {
        return;
    }
    do {
        WaitByLoop(count);
    } while (func_02096358(14, a, 0) != 0);
}
