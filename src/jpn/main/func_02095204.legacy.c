extern int data_021a6650;
extern int data_021a6654;
extern void func_0209275c(void *p);
extern void func_0209595c(void);
extern void func_02095b24(void);

void func_02095204(void) {
    if (data_021a6650 != 0) {
        return;
    }
    data_021a6650 = 1;
    func_0209275c(&data_021a6654);
    func_0209595c();
    func_02095b24();
}
