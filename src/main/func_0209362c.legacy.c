extern unsigned short data_021a66d0;
extern int data_021a66d4[2];
extern void func_02093084(void);
extern void func_020905dc(int x);

void func_0209362c(void) {
    unsigned short *p = &data_021a66d0;
    if (*p != 0) {
        return;
    }
    *p = 1;
    func_02093084();
    data_021a66d4[0] = 0;
    data_021a66d4[1] = 0;
    func_020905dc(0x10);
}
