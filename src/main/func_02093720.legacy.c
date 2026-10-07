extern unsigned short data_021a66dc;
extern unsigned long long data_021a66e8;
extern int data_021a66e4, data_021a66e0;
extern int func_020905dc(int);
void func_02093720(void) {
    if (data_021a66dc) return;
    data_021a66dc = 1;
    data_021a66e8 = 0;
    func_020905dc(4);
    data_021a66e4 = 0;
    data_021a66e0 = 0;
}
