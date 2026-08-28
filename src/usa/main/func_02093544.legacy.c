extern unsigned short data_021a65f0;
extern int data_021a65f4[2];
extern void func_02092f9c(void);
extern void func_020904f4(int x);

void func_02093544(void) {
    unsigned short *p = &data_021a65f0;
    if (*p != 0) {
        return;
    }
    *p = 1;
    func_02092f9c();
    data_021a65f4[0] = 0;
    data_021a65f4[1] = 0;
    func_020904f4(0x10);
}
