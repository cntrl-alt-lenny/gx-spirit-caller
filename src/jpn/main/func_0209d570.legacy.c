extern void func_02096134(void);
extern void func_02096340(int code, void (*callback)(void));
extern void func_0209d4f0(void);
extern int data_021a8c44;

void func_0209d570(void) {
    func_02096134();
    func_02096340(0xe, func_0209d4f0);
    data_021a8c44 = 0;
}
