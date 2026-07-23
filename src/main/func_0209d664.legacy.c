extern void func_02096228(void);
extern void func_02096434(int code, void (*callback)(void));
extern void func_0209d5e4(void);
extern int data_021a8d24;

void func_0209d664(void) {
    func_02096228();
    func_02096434(0xe, func_0209d5e4);
    data_021a8d24 = 0;
}
