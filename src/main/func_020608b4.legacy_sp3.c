extern void *func_02060c9c(int unused0, int unused1);
/* The original supplies only r0 to this four-argument thunk. */
extern int func_020ace00();
extern int func_02060b84(int a, int b, int c);
extern void func_02060604(int index, int a, int b, int c, int d);
extern char data_021013ac[], data_021013b4[], data_021013b8[], data_021013bc[];

void func_020608b4(int s) {
    int a, b, c, d, index;
    a = func_020ace00((int)func_02060c9c(s, (int)data_021013ac));
    b = func_020ace00((int)func_02060c9c(s, (int)data_021013b4));
    c = func_020ace00((int)func_02060c9c(s, (int)data_021013b8));
    d = func_020ace00((int)func_02060c9c(s, (int)data_021013bc));
    index = func_02060b84(2, c, b);
    if (index == -1) return;
    func_02060604(index, a, d, 0, 0);
}
